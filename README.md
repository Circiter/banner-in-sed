# banner-in-sed

A small utility for printing an "ASCII-art" banner for a given string. This sed-script essentially
concatenates a predefined matrices corresponding to the characters of a string. Supports autokerning,
i.e. automatic fitting of character matrices to optimize intercharacter distances.

(There is also support for the animation of the kerning process, just-for-fun.)

Possible uses:
- After-login banner,
- Popup message,
- CAPTCHA. :)

Limitations:
- No "smushing" (see documentation in `figlet` distribution for definitions);
   autokerning stops when the neighbor matrices touch,
- No multiple lines of text (may be fixed in the future),
- Many more limitations; it's hard even to list them :).

Closest analogs: banner (or sysvbanner), [figlet](http://www.figlet.org) (см. также [репозиторий](https://github.com/cmatsuoka/figlet) на GitHub).

Usage:
```sh
./generate.sh 3x5.flf
echo Hello | ./banner.sed
```

(Contains `3x5.flf` font from the `figlet` distribution.
See the file (as text) for copyright information.)

Read the code in `banner.code.part`, `generate.sh`, and `import-font.sed` for detailed
information on the implementation.

(c) Circiter (mailto:xcirciter@gmail.com)
License: MIT.
