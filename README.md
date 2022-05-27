# vim配置

    git clone https://github.com/csfenghan/my_nvim_config.git
    cp -r my_nvim_config/* ~/.config/nvim

## 安装插件
进入nvim，运行
    :PlugInstall(最好用代理方便)

## 配置COC

### 1. 安装Nodejs(COC插件需要nodejs)

coc对node的版本有所要求，安装时需要注意

### 2.配置COC扩展并安装对应的LSP

进入nvim后运行
    CocInstall coc-clangd coc-pyright coc-json coc-cmake coc-git coc-pairs coc-snippets

## 问题

1. 显示neovim不支持python3

   `pip3 install --user --upgrade pynvim`

2. bufferline.nvim不显示图标
需要设置terminal的终端字体，比如windows terminal的话就需要在windows中安装DroidSansMono Nerd Font字体，然后将终端字体切换到该字体即可