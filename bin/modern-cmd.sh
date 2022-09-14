sudo apt install bat
cargo install exa
cargo install du-dust
cd $HOME/src/
git clone 'https://github.com/muesli/duf.git'
cd duf
go build
sudo ln -s $HOME/src/duf/duf /usr/local/bin/duf
