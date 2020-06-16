#!/bin/sed -Enf

x
# List all the supported characters.
s/^.*$/ !'#\$%\&'\(\)\*\+,\-\.\/0123456789:;<=>\?@/
s/$/ABCDEFGHIJKLMNOPQRSTUVWXYZ\[\\\]^_`/
s/$/abcdefghigklmnopqrstuvwxyz\{\|\}~/

# List of the characters that need to be escaped.
s/$/\n\$\\\(\)\*\+\-\.\/\?\\\[\]\{\}\|/

x
s/^.*$/s\/\$\/\\n \\n\//; p

:again

#s/\x0d//g # Support for crlf line-ending.

s/^.*[^@]$//
s/^(.*[^@])@$/s\/\$\/\1\\n\//
s/^@$//
/^.*@@/ {
    s/^(.*)@@$/s\/\$\/\1\\n\/\n/
    s/$/$$$/
    G
    /\$\$\$.* [^\n]/! s/\$\$\$.*$// # FIXME: We can quit from here.
    # Escape current character if it is necessary.
    s/\$\$\$.* (.)[^\n]*\n.*\1.*$/s\/\$\/\\n\\\1\\n\//
    # Or print it "as is".
    s/\$\$\$.* (.).*$/s\/\$\/\\n\1\\n\//
    x
    s/ ([^\n])/\1 /
    x
}

/./ p

n
bagain
