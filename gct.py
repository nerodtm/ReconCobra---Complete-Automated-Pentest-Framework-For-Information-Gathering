#!/usr/bin/env python3

# GCTsubDomainDownloader

import requests
import re
import json
import sys,os
import traceback
import argparse
import time,datetime
from tqdm import tqdm

proxies = None

sess = requests.Session()

#text highlight
class Colored(object):
    RED = '\033[31m'
    GREEN = '\033[32m'
    YELLOW = '\033[33m'
    BLUE = '\033[34m'
    FUCHSIA = '\033[35m'
    CYAN = '\033[36m'
    WHITE = '\033[37m'

    #: no color
    RESET = '\033[0m'

    def color_str(self, color, s):
        return '{}{}{}'.format(
            getattr(self, color),
            s,
            self.RESET
        )

    def red(self, s):
        return self.color_str('RED', s)

    def green(self, s):
        return self.color_str('GREEN', s)

    def yellow(self, s):
        return self.color_str('YELLOW', s)

    def blue(self, s):
        return self.color_str('BLUE', s)

    def fuchsia(self, s):
        return self.color_str('FUCHSIA', s)

    def cyan(self, s):
        return self.color_str('CYAN', s)

    def white(self, s):
        return self.color_str('WHITE', s)

#domainfinde function
class Domain:
    def __init__(self,search_domain,save_path,show_expired):
        self.search_domain = search_domain
        self.save_path = save_path
        self.show_expired = show_expired
        self.domains = {}
        self.total_num = 0
        self.page_token = ''
        self.flag = 0
        self.headers = {"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36"}
        self.indexUrl = 'https://transparencyreport.google.com/transparencyreport/api/v3/httpsreport/ct/certsearch?include_subdomains=true'
        self.nextUrl = 'https://transparencyreport.google.com/transparencyreport/api/v3/httpsreport/ct/certsearch/page?p='

    def get_domain(self):
        c = Colored()

        do = 10
        while do > 0:
            if self.page_token != '':
                req = sess.get(self.nextUrl+self.page_token,headers=self.headers,proxies=proxies,verify=True)
            else:
                if self.show_expired == 'show':
                    req = sess.get(self.indexUrl+'&domain='+self.search_domain+'&include_expired=true',headers=self.headers,proxies=proxies,verify=True)
                else:
                    req = sess.get(self.indexUrl+'&domain='+self.search_domain,headers=self.headers,proxies=proxies,verify=True)
            rep = (req.text).lstrip(")]}'")
            rep = re.sub(r'\[\[\"https\.ct\.cdsr\"\,','[',rep)
            rep = rep.replace('\n','').replace('\\','')
            rep = rep[:-1]
            rep = json.loads(rep)

            if self.total_num == 0:
                break
            else:
                t = rep[2][0]
            p = re.match( r'[a-zA-Z0-9]{10}',t)
            if p:
                break
            else:
                do = do - 1
                print(("  "+c.red("Occurred an Connection error...retry count down %d" %(do))))

        if self.total_num == 0:
           for x in rep[1]:
               self.total_num += x[3]
           if self.total_num != 0:
               print(("  "+c.red(str(self.total_num))+c.green(" subdomain certificate logs found")))
           else:
               print(("  "+c.red(str(self.total_num))+c.green(" subdomain certificate logs found")))
               print((c.red("[+]No subdomain certificate log found")))
               exit()

        for y in rep[0]:
            if y[1] not in self.domains:
                self.domains[y[1]] = {}
                self.domains[y[1]]['expired_time'] = int((str(y[4]))[:-3])
                self.domains[y[1]]['is_expired'] = 0
            else:
                if self.domains[y[1]]['expired_time'] < int((str(y[4]))[:-3]):
                    self.domains[y[1]]['expired_time'] = int((str(y[4]))[:-3])
                    now = time.time()
                    if now >int((str(y[4]))[:-3]):
                        self.domains[y[1]]['is_expired'] = 1
                    else:
                        self.domains[y[1]]['is_expired'] = 0
                else:
                    continue

        pageNum = (self.total_num//10) + 1
        with tqdm(total=self.total_num,ncols=80) as pbar:
            if self.flag < pageNum:
               if self.total_num - (self.flag)*10 <10:
                   pbar.update(self.total_num)
               else:
                   pbar.update((self.flag+1)*10)
                   self.flag = self.flag+1
        if rep[2][1] != None:
            self.page_token = rep[2][1]
            self.get_domain()

    def run(self):
        c = Colored()
        print(("[+]Searching subdomains for "+c.cyan(self.search_domain)))
        self.get_domain()
        print((c.fuchsia("[+]Printing subdomains for ")+c.cyan(self.search_domain)))
        for key,value in list(self.domains.items()):
            if value['is_expired'] == 1 and self.show_expired == 'show':
                print((key+"   "+c.red("[Expired on "+datetime.datetime.fromtimestamp(value['expired_time']).strftime('%Y-%m-%d')+"]")))
            else:
                print(key)
        self.write_log()

    def write_log(self):
        c = Colored()
        if(os.name == 'posix'):
            path = os.getcwd()+"/"+self.save_path+"/"
        else:
            path = os.getcwd()+"\\"+self.save_path+"\\"
        if os.path.exists(path) == False:
            os.mkdir(path)
        with open(path+self.search_domain+'.txt', 'w') as f:
             for key,value in list(self.domains.items()):
                 if value['is_expired'] == 1 and self.show_expired == 'show':
                     f.write(key+"   "+"[Expired on "+datetime.datetime.fromtimestamp(value['expired_time']).strftime('%Y-%m-%d')+"]\r\n")
                     f.flush()
                 else:
                     f.write(key+"\r\n")
                     f.flush()
        print((c.fuchsia("[+]The ")+c.cyan(self.search_domain)+c.fuchsia("'s subdomains have been saved in ")+c.cyan(path+self.search_domain+".txt")))
        f.close()

if '__main__' == __name__:
    print('''
    ''')

    c = Colored()
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--domain', dest='search_domain', action='store',required=True,help='The domain you want to search(input example: google.com/twitter.com),no need to add http/https')
    parser.add_argument('-s', '--save', dest='save_path', action='store', default='log',required=False,help='The folder that subdomains will be saved under current path,(default:log),no need to /')
    parser.add_argument('-e', '--expired', dest='show_expired', action='store', required=True,help='show the subdomains which have an expired Security certificate(input choices:show/hide)')
    args = parser.parse_args()

    if re.match(r"^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}$",args.search_domain):
        try:
            if args.show_expired == 'show' or args.show_expired == 'hide':
                d = Domain(args.search_domain, args.save_path,args.show_expired)
                d.run()
            else:
                print((c.red("[+]argument --expired/-e is illegal!")))
                exit()
        except KeyboardInterrupt:
            print((c.red("[+]Ctrl+c exit...")))
            exit()
        except Exception:
            traceback.print_tb(sys.exc_info()[2])
            print((c.red("[+]Error exit...")))
    else:
        print((c.red("[+]argument --domain/-d is illegal!")))
        exit()