# Git-Get

`git get` has the same syntax as `git clone`, however `git get` will place your
cloned repository into heirarchy that mirrors the URL. For example, if the
repository is `https://github.com/jmbaur/git-get`, the cloned directory will be
`~/Projects/github.com/jmbaur/git-get`. For cloning over SSH, the expected URL
is of the form `ssh://<user>@<host>/path/to/repo`, not
`<user>@<host>:path/to/repo`.
