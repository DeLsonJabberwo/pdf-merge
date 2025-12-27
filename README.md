# pdf-merge

A simple command-line utility for merging PDFs written in Go.

## Installation

To install, use go:
```
go install github.com/DeLsonJabberwo/pdf-merge@latest
```
Or download the binary from the [Releases](https://github.com/DeLsonJabberwo/pdf-merge/releases).

## Usage

```
pdf-merge [-o output.pdf] [input.pdf...]
```
| Argument  | Description   | Default       |
| --------  | -----------   | -------       |
| `-o`      | output file   | output.pdf    |
| other     | input files   | all pdfs in dir |

If no input files are specified, all PDFs in the directory will be merged in alphabetical order.

