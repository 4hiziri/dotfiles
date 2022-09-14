#!/bin/bash

sudo apt install uim-xim uim-skk skktools
cd $HOME/src/
git clone 'https://github.com/skk-dev/dict'
cd dict
skkdic-expr2 SKK-JISYO.L + SKK-JISYO.propernoun + SKK-JISYO.jinmei + SKK-JISYO.geo > SKK-JISYO.MERGED
/bin/bash $HOME/dotfiles/script/k2c.sh SKK-JISYO.MERGED > SKK-JISYO.k2c
skkdic-expr2 SKK-JISYO.L + SKK-JISYO.propernoun + SKK-JISYO.jinmei + SKK-JISYO.geo + SKK-JISYO.k2c > SKK-JISYO.MERGED
