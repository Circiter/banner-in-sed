#!/bin/sh

if [ "x$1" = x ]; then
    echo 'usage: ' $0 '<font.flf>'
    exit 1
fi

fontfile="$1"

cat "$fontfile" | sed 's/\x0d//g' | ./import-font.sed > font.part.tmp
echo '#!/bin/sed -Enf' > banner.sed
cat font.part.tmp banner.code.part >> banner.sed
chmod +x banner.sed
