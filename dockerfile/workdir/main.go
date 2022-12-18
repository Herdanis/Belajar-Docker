package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		port := os.Getenv("APP_PORT")
		fmt.Fprintf(w, port)
	})

	http.ListenAndServe(":80", nil)
}
