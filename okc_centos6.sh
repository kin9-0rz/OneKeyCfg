#!/bin/sh

echo "配置源..."
sudo yum -q -e 0 -y install epel-release
sudo yum -q -e 0 makecache
# sudo yum -y update # Take care about updating the OS.

echo "安装git相关..."
sudo yum -q -e 0 -y install bash-completion.noarch git.x86_64 gitflow.noarch

echo "安装VIM..."
sudo yum -q -e 0 -y install vim-minimal.x86_64 vim-filesystem.x86_64 vim-enhanced.x86_64 vim-common.x86_64
cp ./vimrc ~/.vimrc

echo "安装配置zsh..."
sudo yum -q -e 0 -y install zsh.x86_64 wget

echo "安装oh my zhs..."
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i 's/robbyrussell/ys/g' ~/.zshrc
sed -i 's/(git)/(git-flow)/g' ~/.zshrc


echo "配置完毕，重启SHELL试试。"
