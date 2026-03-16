#!/bin/bash

mkdir -p "~/src"
cd "~/src"
git clone "https://github.com/skk-dev/dict"
cd dict
for JISYO in $(ls -1 "SKK-JISYO.*"); do
    nkf -ic=e -oc=w8 -O $JISYO "$JISYO.utf-8"
done
cd "~/src"
git clone "https://github.com/4hiziri/my-skk-dict"

DICT_NAME=SKK-JISYO.yaskkserv2
DICT_PATH="$HOME/.config/skk/"

mkdir -p $DICT_PATH
yaskkserv2_make_dictionary --utf8 --dictionary-filename="$DICT_PATH/$DICT_NAME" "$HOME/src/dict/SKK-JISYO.L.utf-8" "$HOME/src/my-skk-dict/SKK-JISYO.L.k2c.utf-8" "$HOME/src/dict/SKK-JISYO.fullname.utf-8" "$HOME/src/dict/SKK-JISYO.jinmei.utf-8" "$HOME/src/dict/SKK-JISYO.propernoun.utf-8" "$HOME/src/dict/SKK-JISYO.geo.utf-8" "$HOME/src/dict/SKK-JISYO.station.utf-8" "$HOME/src/dict/SKK-JISYO.JIS2.utf-8" "$HOME/src/dict/SKK-JISYO.assoc.utf-8" "$HOME/src/dict/SKK-JISYO.itaiji.utf-8" "$HOME/src/dict/zipcode/SKK-JISYO.zipcode.utf-8" "$HOME/src/dict/zipcode/SKK-JISYO.office.zipcode.utf-8"

