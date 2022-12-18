package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		hname, _ := os.Hostname()
		fmt.Fprintf(w, hname)
	})

	http.ListenAndServe(":80", nil)
}
