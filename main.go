package main

import (
	"log"
	"net/url"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"github.com/mitchellh/go-homedir"
)

func must(err error) {
	if err != nil {
		log.Fatal(err)
	}
}

func main() {
	projDir, ok := os.LookupEnv("PROJ_DIR")
	if !ok {
		projDir = "~/Projects"
	}

	projDir, err := homedir.Expand(projDir)
	must(err)

	args := os.Args[1:]

	u := &url.URL{}
	for _, arg := range args {
		if m, err := url.ParseRequestURI(arg); err == nil {
			u = m
			break
		}
	}

	dir := filepath.Join(projDir, strings.ToLower(u.Host), strings.ToLower(u.Path))

	cmd := exec.Command("git", "clone")
	cmd.Args = append(cmd.Args, args...)
	cmd.Args = append(cmd.Args, dir)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Env = os.Environ()
	log.Println(cmd.Args)
	must(cmd.Run())
}
