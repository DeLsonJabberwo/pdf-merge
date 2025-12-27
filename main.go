package main

import (
	"flag"
	"io/fs"
	"log"
	"os"
	"path/filepath"

	pdf "github.com/pdfcpu/pdfcpu/pkg/api"
)

func main() {
	outputFileName := flag.String("o", "output.pdf", "output file name")

	flag.Parse()

	inputFileNames := flag.Args()

	if len(inputFileNames) == 0 {
		dir, err := os.Getwd()
		if err != nil {
			log.Fatalf("Error: %s\n", err)
		}

		var pdfs []string
		filepath.WalkDir(dir, func(path string, d fs.DirEntry, err error) error {
			if d.IsDir() {
				return filepath.SkipDir
			}
			if filepath.Ext(d.Name()) == ".pdf" {
				pdfs = append(pdfs, d.Name())
			}
			return nil
		})
		inputFileNames = pdfs
	}

	if len(inputFileNames) == 0 {
		log.Printf("No pdfs to merge.\n")
		return
	}

	err := pdf.MergeCreateFile(inputFileNames, *outputFileName, false, nil)
	if err != nil {
		log.Fatalf("Error: %s\n", err)
	}
}
