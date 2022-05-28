" vim插件的详细配置

""""""""""""""""""""""""""""
" coc配置
""""""""""""""""""""""""""""
set hidden              " TextEdit might fail if hidden is not set.
set nobackup            " Some servers have issues with backup files, see #649.
set nowritebackup
set cmdheight=2         " Give more space for displaying messages.
set updatetime=300
set shortmess+=c        " Don't pass messages to |ins-completion-menu|.

if has("nvim-0.5.0") || has("patch-8.1.1564")  " Always show the signcolumn,
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! g:Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Add (Neo)Vim's native statusline support.
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

""""""""""""""""""""""""""""
" LeaderF
""""""""""""""""""""""""""""
" ignore files
let g:Lf_WildIgnore = {
        \ 'dir':['build', '.git'],
        \ 'file':['*.o', '*.a', '*.so']
      \ }

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

let g:Lf_WindowPosition = 'popup'       " popup mode
let g:Lf_PopupWidth = 0.8
let g:Lf_PopupHeight = 0.9
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'

""""""""""""""""""""""""""""
" coc-snippet
""""""""""""""""""""""""""""
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

""""""""""""""""""""""""""""
" vim-floaterm
""""""""""""""""""""""""""""
let g:floaterm_height=0.7
let g:floaterm_width=0.7
hi FloatermBorder guibg=orange guifg=cyan

" 基于floaterm实现的快速命令功能
let g:quick_F2 = ""
let g:quick_F3 = ""
let g:quick_F4 = ""

function! QuickCommand(args, create)
    " 选择
    let l:command = ""

    if a:args == "F2"
        let command = g:quick_F2
    elseif a:args == "F3"
        let command = g:quick_F3
    elseif a:args == "F4"
        let command = g:quick_F4
    endif

    if (command == "") 
        return
    endif

    " 运行
    let l:temp = @a
    let @a = command

    if a:create
        FloatermNew
        "call feedkeys("\<A-q>")
    endif
    set modifiable
    put a
    call feedkeys("\<CR>")

    let @a = temp
endfunction


""""""""""""""""""""""""""""
" nerdtree配置
""""""""""""""""""""""""""""
let g:NERDTreeWinSize=23
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


""""""""""""""""""""""""""""
" buffline.nvim配置
""""""""""""""""""""""""""""
lua << EOF
require('bufferline').setup {
  highlights = {
    buffer_selected = {
      --guifg=normal,
      --guibg=0xC0C0C0,
      gui="italic" 
    }        
  },
  options = {
    -- 使用 nvim 内置lsp
    diagnostics = "nvim_lsp",
    -- 左侧让出 nvim-tree 的位置
    offsets = {{
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left"
    }}
  }
}

EOF

""""""""""""""""""""""""""""
" gui配置
""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_transparent_bg = 1
set termguicolors
set guifont=DroidSansMono\ Nerd\ Font\ 11
"autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
colorscheme gruvbox
hi Normal ctermbg=NONE guibg=NONE

