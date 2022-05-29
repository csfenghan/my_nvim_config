"""""""""""""""""""""""""""""""""""""""
"  vim插件
"""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}         "coc插件（补全、跳转、语法检查）
    Plug 'Yggdroot/LeaderF'                                 "文件、函数管理
    Plug 'voldikss/vim-floaterm'                            "内置终端
    Plug 'vim-airline/vim-airline'                          "vim状态栏
    Plug 'morhetz/gruvbox'                                  "真彩色主题
    Plug 'preservim/nerdtree'                               "目录树
    Plug 'puremourning/vimspector'                          "调试
    Plug 'kyazdani42/nvim-web-devicons'                     " Recommended (for coloured icons)
    Plug 'ryanoasis/vim-devicons'                           " Icons without colours
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
    Plug 'csfenghan/custom-vim'
    Plug 'tpope/vim-fugitive'                               " 在vim中执行git命令
    Plug 'airblade/vim-gitgutter'                           " 显示改动
call plug#end()

source ~/.config/nvim/my_config.vim
source ~/.config/nvim/my_shortcut.vim

"""""""""""""""""""""""""""""""""""""""
"  全局基础配置
"""""""""""""""""""""""""""""""""""""""
syntax on
set jumpoptions+=stack
set nu	
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab                                               "空格代替tab
set softtabstop=4                                           "使用空格代替tab时，backspace可以回退tab
set backspace=2                                             "可以删除任意字符
set encoding=UTF-8
set fileencodings=utf-8,ucs-bom,cp936,gbk,gbk2312
set fileencoding=utf-8

augroup VCenterCursor                                       " 光标总是在居中附近
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/4
augroup END


" 主题配置
let g:airline_powerline_fonts = 1
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_transparent_bg = 1

set termguicolors
" gui配置
if exists("g:gonvim_running")
    let g:airline#extensions#tabline#enabled = 0
    colorscheme gruvbox
elseif exists("g:neovide")
    let g:neovide_transparency=0.85
    let g:neovide_fullscreen=v:true
    let g:neovide_remember_window_size = v:true
    let g:guifont = Consolas:h24
    colorscheme gruvbox
    hi Normal ctermbg=NONE guibg=NONE
else                                                        " 实际上windows terminal就支持鼠标功能，所以自带的就挺好用
    let g:airline#extensions#tabline#enabled = 1
    colorscheme gruvbox
    hi Normal ctermbg=NONE guibg=NONE
endif


"""""""""""""""""""""""""""""""""""""""
"  局部基础配置
"""""""""""""""""""""""""""""""""""""""
" 局部配置相关的路径
let g:nvim_root = "/home/fenghan/.config/nvim"
let g:local_root = nvim_root."/.local"
let g:curr_root = substitute(substitute(system("pwd"), "\n", "", "g"), "/", "_", "g")[1:]
let g:curr_local_root = local_root."/".curr_root
let g:session_path = curr_local_root."/session.vim"
let g:local_config_path = g:curr_local_root."/local_config.vim"

if file_readable(g:local_config_path)
    execute "source ".g:local_config_path
endif

function FOpenLocalConfig() 
    if !isdirectory(g:curr_local_root)
        execute("!mkdir ".g:curr_local_root) 
    endif
    if !file_readable(g:local_config_path)
        execute("!cp ".g:nvim_root."/example/local_config.vim"." ".g:curr_local_root) 
    endif
    execute("e ".g:local_config_path)
    call feedkeys("\<ESC>")
endfunction
execute "autocmd BufWritePost ".g:local_config_path." bufdo! source ".g:local_config_path

command OpenLocalConfig             call FOpenLocalConfig()
command RemoveLocalConfig           execute("!trash ".g:curr_local_root)
command OpenGlobalInit              e ~/.config/nvim/init.vim
command OpenGlobalConfig            e ~/.config/nvim/my_config.vim
command OpenGlobalShortcut          e ~/.config/nvim/my_shortcut.vim
