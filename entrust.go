package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"net/http"
)

func main() {
	var domain string
	flag.StringVar(&domain, "domain", "", "Domain to search for CT logs")
	flag.Parse()
	fmt.Println(domain)
	entrustcertsearch(domain)
}

func entrustcertsearch(domain string) {
	APIURL := fmt.Sprintf("https://ctsearch.entrust.com/api/v1/certificates?fields=issuerCN,subjectO,issuerDN,issuerO,subjectDN,signAlg,san,publicKeyType,publicKeySize,validFrom,validTo,sn,ev,logEntries.logName,subjectCNReversed&domain=%s&includeExpired=false&exactMatch=false&limit=5000", domain)

	req, err := http.NewRequest(http.MethodGet, APIURL, nil)
	if err != nil {
		panic(err)
	}

	client := http.DefaultClient
	resp, err := client.Do(req)
	if err != nil {
		panic(err)
	}

	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		panic(err)
	}

	fmt.Printf(string(body))
}