package main

import (
	"fmt"
	"os"
	"path"
	"strings"
)

func main() {
  args:=os.Args[1:]
  curDir,err:=os.Getwd()
  if err!=nil{
    fmt.Println(err)
    return
  }
  
  for _, a := range args {
    files,e := os.ReadDir(curDir)
    if e != nil {
      fmt.Println(curDir)
      return
    }
    var found bool
    for _,f := range files{
      // check if a is in f.Name()
      if strings.Index(f.Name(),a)!=-1{ 
        curDir = path.Join(curDir,f.Name())
      found = true
        break
      }
    }
    if !found {
      fmt.Println(curDir)
      return
    }
  }

  fmt.Println(curDir)
}
