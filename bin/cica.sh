[Isudo apt install unar
cd "$HOME"
wget 'https://github.com/miiton/Cica/releases/download/v5.0.3/Cica_v5.0.3.zip'
unar Cica_v5.0.3.zip
cd Cica_v5.0.3
mkdir -p "$HOME/.local/share/fonts/Cica"
cp *.ttf "$HOME/.local/share/fonts/Cica"
fc-cache -f -v
cd ../
rm -rf 'Cica_v5.0.3/' 'Cica_v5.0.3.zip'
