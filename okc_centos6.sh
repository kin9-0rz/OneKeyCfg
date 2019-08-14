#!/bin/sh

cfg_update() {
    sudo yum -q -e 0 -y install epel-release
    sudo yum makecache
    sudo yum -y update # Take care about updating the OS.
}

cfg_git() {
    sudo yum -q -e 0 -y install bash-completion.noarch git.x86_64 gitflow.noarch
}

cfg_zsh() {
    sudo yum -q -e 0 -y install zsh.x86_64 wget
}

cfg_oh_my_zsh() {
    sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sed -i 's/robbyrussell/ys/g' ~/.zshrc
    sed -i 's/(git)/(git-flow)/g' ~/.zshrc
}

cfg_vim() {
    sudo yum -q -e 0 -y install vim-minimal.x86_64 vim-filesystem.x86_64 vim-enhanced.x86_64 vim-common.x86_64
    cp ./vimrc ~/.vimrc
}

cfg_go() {
    wget -q "https://www.vim.org/scripts/download_script.php?src_id=11735" -O go.vim
    sudo cp go.vim /usr/share/vim/vim74/syntax/
    FTDETECT=~/.vim/ftdetect
    if [ ! -d $FTDETECT ];then
        mkdir $FTDETECT
    fi
    touch $FTDETECT/go.vim
    echo "au BufRead,BufNewFile *.go set filetype=go" > ~/.vim/ftdetect/go.vim
}

if [ $# != 1 ];then
    echo "选择功能"
    echo [0] - 全部配置\(不更新系统\)
    echo [1] - 更新系统\(可选，根据情况选择\)
    echo [2] - git、gitflow
    echo [3] - 配置zsh
    echo [4] - 配置oh-my-zsh
    echo [5] - 配置vim
    echo [6] - 配置vim-go语法
    exit
fi

if [ $0 == 0 ];then
    echo "全部配置"
    cfg_git
    cfg_zsh
    cfg_oh_my_zsh
    cfg_vim
    cfg_go
    exit
fi

if [ $0 == 1 ];then
    cfg_update
    exit
fi

if [ $0 == 2 ];then
    cfg_git
    exit
fi

if [ $0 == 3 ];then
    cfg_zsh
    exit
fi

if [ $0 == 4 ];then
    cfg_oh_my_zsh
    exit
fi

if [ $0 == 5 ];then
    cfg_vim
    exit
fi

if [ $0 == 6 ];then
    cfg_go
    exit
fi
