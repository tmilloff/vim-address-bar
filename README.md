# vim-address-bar
Adds the `:AddressBar` command, which pops open a one line buffer with the current file's path. You can edit the path and press enter to go to the file at the new path.

## Why?
Take the following two file paths
File 1 `~/project/src/one/foo/bar/index.js`
File 2 `~/project/src/two/foo/bar/index.js`

I work in a similarly structured codebase, and often have to make an edit to file 1, then make the same edit to file 2.
With this plugin, getting from file 1 to 2 is as simple as typing `:AddressBar<CR>?onecwtwo<CR>`.

## Is there a better way to do this?
If you know of one, let me know!
