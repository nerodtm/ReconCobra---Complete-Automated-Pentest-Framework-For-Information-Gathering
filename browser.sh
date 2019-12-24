#!/bin/bash
TARGET="$1"
BROWSER="xdg-open"
VER="1.9"
OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
DELAY=1
RESET='\e[0m'

echo "[ + ] Enter Url" 
read URL
if [ -z $URL ]; then
	echo -e "$OKORANGE + browser.sh URL $RESET"
	exit
fi

# LOAD WEBSITE IN A WEB BROSER
$BROWSER "https://www.google.com/search?q=site:$TARGET+ext:cgi+OR+ext:php+OR+ext:asp+OR+ext:aspx+OR+ext:jsp+OR+ext:jspx+OR+ext:swf+OR+ext:fla+OR+ext:xml" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:$TARGET+ext:doc+OR+ext:docx+OR+ext:csv+OR+ext:pdf+OR+ext:txt+OR+ext:log+OR+ext:bak" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:$TARGET+ext:action+OR+struts" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:pastebin.com+$TARGET" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:linkedin.com+employees+$TARGET" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:$TARGET+intitle:index.of" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:$TARGET+ext:xml+|+ext:conf+|+ext:cnf+|+ext:reg+|+ext:inf+|+ext:rdp+|+ext:cfg+|+ext:txt+|+ext:ora+|+ext:ini" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:$TARGET+ext:sql+|+ext:dbf+|+ext:mdb" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:$TARGET+ext:log" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:$TARGET+ext:bkf+|+ext:bkp+|+ext:bak+|+ext:old+|+ext:backup" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:$TARGET+intext:%22sql+syntax+near%22+|+intext:%22syntax+error+has+occurred%22+|+intext:%22incorrect+syntax+near%22+|+intext:%22unexpected+end+of+SQL+command%22+|+intext:%22Warning:+mysql_connect()%22+|+intext:%22Warning:+mysql_query()%22+|+intext:%22Warning:+pg_connect()%22" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:$TARGET+ext:doc+|+ext:docx+|+ext:odt+|+ext:pdf+|+ext:rtf+|+ext:sxw+|+ext:psw+|+ext:ppt+|+ext:pptx+|+ext:pps+|+ext:csv" 2> /dev/null
$BROWSER "https://www.google.com/search?q=site:$TARGET+ext:php+|+ext:asp+|+ext:aspx+|+ext:jspf+|+ext:jspa+|+ext:txt+|+ext:swf" 2> /dev/null
