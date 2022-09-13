cd "$HOME"
wget 'https://github.com/miiton/Cica/releases/download/v5.0.3/Cica_v5.0.3.zip'
unar Cica_v5.0.3.zip
cd Cica_v5.0.3
cp *.ttf ~/.local/share/fonts/
fc-cache -f -v
