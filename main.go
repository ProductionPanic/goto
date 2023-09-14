package main

import (
	"fmt"
	"os"
	"path"
	"strings"
)

func main() {
	args := os.Args[1:]
  if len(args) == 0 || args[0] == "--help" {
    showHelp()
    return
  }
	var curDir string
  var newArgs []string
	for _, a := range args {
		if a == "-h" || a == "--home" {
			curDir,_ = os.UserHomeDir()
		} else {
      newArgs = append(newArgs, a)
    }
	}
  args = newArgs
	if curDir == "" {
    var err error
		curDir, err = os.Getwd()
		if err != nil {
			fmt.Println(err)
			return
		}
	}

	for _, a := range args {
		if strings.HasPrefix(a, "..") {
			curDir = path.Join(curDir, a)
			continue
		}
		files, e := os.ReadDir(curDir)
		if e != nil {
      goCd(curDir)
			return
		}
		var found bool
		for _, f := range files {
			if !f.Type().IsDir() {
				continue
			}
			n1 := strings.ToLower(f.Name())
			n2 := strings.ToLower(a)

			// check if a is in f.Name()
			if strings.Index(n1, n2) != -1 {
				curDir = path.Join(curDir, f.Name())
				found = true
				break
			}
		}
		if !found {
      goCd(curDir)
			return
		}
	}

  goCd(curDir)
}

func showHelp() {
  fmt.Println("Usage: goto [options] [dir]")
  fmt.Println("Options:")
  fmt.Println("  -h, --home\t\tStart from home directory (~/)")
  fmt.Println("  --help\t\tshow this help message")
}

func goCd(dir string) {
  fmt.Println("[cd]"+dir)
}
