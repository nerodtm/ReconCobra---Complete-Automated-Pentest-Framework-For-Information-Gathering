package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"math/rand"
	"net/http"
	"net/url"
	"os"
	"strings"
	"time"
)

var _ = fmt.Println

// Log Certficate logs
type Log struct {
	ID        string `json:"id"`
	Index     int64  `json:"index"`
	Timestamp string `json:"timestamp"`
}

// Certificate Certspotter Certificate Object
type Certificate struct {
	Type         string   `json:"type"`
	Sha256       string   `json:"sha256"`
	DNSNames     []string `json:"dns_names"`
	PubkeySha256 string   `json:"pubkey_sha256"`
	Issuer       string   `json:"issuer"`
	NotBefore    string   `json:"not_before"`
	NotAfter     string   `json:"not_after"`
	Logs         []Log    `json:"logs"`
	Data         string   `json:"data"`
}

type header struct {
	name  string
	value string
}

type query struct {
	key   string
	value string
}

// used for get or post request
type request struct {
	method  string
	url     *url.URL
	body    []byte
	headers []header
	params  []query
}

func randomUserAgent() string {

	userAgents := make([]string, 0)
	userAgents = append(userAgents,
		"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36",
		"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.19 (KHTML, like Gecko) Chrome/1.0.154.53 Safari/525.19",
		"Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.86 Safari/533.4",
		"Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/540.0 (KHTML,like Gecko) Chrome/9.1.0.0 Safari/540.0",
		"Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Ubuntu/10.10 Chromium/8.0.552.237 Chrome/8.0.552.237 Safari/534.10",
		"Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16",
		"Mozilla/5.0 (Windows; U; Windows NT 6.1; x64; fr; rv:1.9.2.13) Gecko/20101203 Firebird/3.6.13",
		"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A",
		"Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25",
		"Mozilla/5.0 (Windows NT 5.2; RW; rv:7.0a1) Gecko/20091211 SeaMonkey/9.23a1pre",
		"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1",
		"Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0",
		"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0",
		"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0",
	)

	// Fisher–Yates shuffle
	// shuffle without allocating any additional slices.
	for i := range userAgents {
		j := rand.Intn(i + 1)
		userAgents[i], userAgents[j] = userAgents[j], userAgents[i]
	}

	return userAgents[rand.Intn(len(userAgents))]
}

func bakeRequest(r request) *http.Request {

	req, err := http.NewRequest(r.method, r.url.String(), bytes.NewBuffer(r.body))
	if err != nil {
		panic(err)
	}

	for _, header := range r.headers {

		req.Header.Set(header.name, header.value)
	}

	if len(r.params) > 0 {

		query := req.URL.Query()

		for _, q := range r.params {

			query.Add(q.key, q.value)
		}

		req.URL.RawQuery = query.Encode()
	}

	return req
}

// makes http get or post query
func makeRequest(r request) *http.Response {

	req := bakeRequest(r)
	client := &http.Client{}

	resp, err := client.Do(req)

	if err != nil {
		log.Fatal(err)
	}

	return resp
}

// CertScraper Request the API for related certificates
func CertScraper(search string) []Certificate {

	url, err := url.Parse("https://certspotter.com/api/v0/certs")

	if err != nil {
		log.Fatal(search)
	}

	body := []byte("")
	headers := []header{
		header{name: "Host", value: "certspotter.com"},
		header{name: "User-Agent", value: randomUserAgent()},
		header{name: "Accept", value: "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"},
		header{name: "Accept-Language", value: "en-US,en;q=0.5"},
		header{name: "'Accept-Encoding'", value: "gzip, deflate, br"},
		header{name: "Connection", value: "keep-alive"},
	}

	params := []query{
		query{key: "domain", value: search},
	}

	resp := makeRequest(request{method: "GET", url: url, body: body, headers: headers, params: params})
	defer resp.Body.Close()

	certificates := make([]Certificate, 0)

	rbody, err := ioutil.ReadAll(resp.Body)

	if err != nil {
		log.Fatal(err)
	}

	err = json.Unmarshal(rbody, &certificates)

	if err != nil {
		log.Fatal(err)
	}

	return certificates
}

func contains(s []string, e string) bool {
	for _, a := range s {
		if a == e {
			return true
		}
	}
	return false
}

// init will be called before the main function
// Its the right place to initialize the seed Value
func init() {

	// note:
	// Each time you set the same seed, you get the same sequence
	// You have to set the seed only once
	// you simply call Intn to get the next random integer
	rand.Seed(time.Now().UTC().UnixNano())
}

func main() {

	if len(os.Args) != 2 {
		log.Fatal("Usage: certdomainfinder example.com")
	}

	domain := os.Args[1]
	duplicateDomains := make([]string, 0)

	certificates := CertScraper(domain)

	for _, certificate := range certificates {
		for _, dnsName := range certificate.DNSNames {
			if !strings.Contains(dnsName, "*") && strings.Contains(dnsName, domain) && !contains(duplicateDomains, dnsName) {

				duplicateDomains = append(duplicateDomains, dnsName)
				fmt.Println(dnsName)
			}
		}
	}
}