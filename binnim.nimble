# Package

version       = "0.1.0"
author        = "John Hammond"
description   = "Read in files to display in hex format for shellcode"
license       = "MIT"
srcDir        = "src"
bin           = @["binnim"]


# Dependencies

requires "nim >= 1.6.14"
requires "cligen >= 1.6.6"
