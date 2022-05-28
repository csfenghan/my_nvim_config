
"""""""""""""""""""""""""""""""""
" 跳转相关
"""""""""""""""""""""""""""""""""
nmap <silent> gd            <Plug>(coc-definition)
nmap <silent> gc            <Plug>(coc-declaration)
nmap <silent> gr            <Plug>(coc-references)

"""""""""""""""""""""""""""""""""
" 语法诊断与辅助功能
"""""""""""""""""""""""""""""""""
nmap <silent> [g            <Plug>(coc-diagnostic-prev)
nmap <silent> ]g            <Plug>(coc-diagnostic-next)
nmap <silent> K             :call Show_documentation()<CR>

nmap <silent> [c            <Plug>(GitGutterPrevHunk)
nmap <silent> ]c            <Plug>(GitGutterNextHunk)

" 批量注释
vmap <silent> ]c            :call custom#Comment()<CR>
vmap <silent> [c            :call custom#UnComment()<CR>

" 全局复制(将寄存器"0中的数据复制到系统粘贴板)
nmap <silent> cc            :call custom#VimGlobalClipboard()<CR>

" 保存
nmap <silent> <C-s>         :w<CR>
imap <silent> <C-s>         <ESC>:w<CR>a

" 取消高亮
nmap <silent> <A-q>         :noh<CR>

"""""""""""""""""""""""""""""""""
" 文件管理与buffer管理
"""""""""""""""""""""""""""""""""
nmap <silent> <C-p>         :LeaderfFile<CR>
nmap <silent> <A-m>         :LeaderfFunction<CR>
nmap <silent> <C-g>         :LeaderfBufTag<CR>
nmap <silent> <A-b>         :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
nmap <silent> <leader>m     :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>

" buffer显示
nmap <silent> <A-l>         :bn<CR>
imap <silent> <A-l>         <ESC>:bn<CR>
nmap <silent> <A-h>         :bp<CR>
imap <silent> <A-h>         <ESC>:bp<CR>
nmap <silent> <A-k>         :bd<CR>

" 文件树
nmap <silent> <C-t>         :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""
" 终端和快捷命令
"""""""""""""""""""""""""""""""""
nmap <silent> <A-t>         :FloatermNew<CR>
tmap <silent> <A-t>         <C-\><C-n>:FloatermNew<CR>
tmap <silent> <A-k>         <C-\><C-n>:FloatermKill<CR>
tmap <silent> <A-h>         <C-\><C-n>:FloatermPrev<CR>
tmap <silent> <A-l>         <C-\><C-n>:FloatermNext<CR>
nmap <silent> <A-=>         :FloatermToggle<CR>
tmap <silent> <A-=>         <C-\><C-n>:FloatermToggle<CR>
tmap <silent> <A-q>         <c-\><c-n> 

" 编译/运行命令
nmap <silent> <F2>          :call QuickCommand("F2", 1)<CR>
tmap <silent> <F2>          <C-\><C-n>:call QuickCommand("F2", 0)<CR>
nmap <silent> <F3>          :call QuickCommand("F3", 1)<CR>
tmap <silent> <F3>          <C-\><C-n>:call QuickCommand("F3", 0)<CR>
nmap <silent> <F4>          :call QuickCommand("F4", 1)<CR>
tmap <silent> <F4>          <C-\><C-n>:call QuickCommand("F4", 0)<CR>

" 调试命令
nmap <silent> <F5>          <Plug>VimspectorContinue
nmap <silent> <leader><F5>  <Plug>VimspectorRestart
nmap <silent> <F6>          <Plug>VimspectorStop
nmap <silent> <leader><F6>  <Plug>VimspectorPause
nmap <silent> <F7>          :call vimspector#Reset()<CR>
nmap <silent> <F8>          <Plug>VimspectorStepInto
nmap <silent> <leader><F8>  <Plug>VimspectorStepOut
nmap <silent> <F9>          <Plug>VimspectorToggleBreakpoint
nmap <silent> <leader><F9>  <Plug>VimspectorAddFunctionBreakpoint
nmap <silent> <F10>         <Plug>VimspectorStepOver

