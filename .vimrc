"忽略大消息"
set ignorecase

"显示行号"
set nu

"按照c语言风格缩进"
set cindent shiftwidth=4

"为C语言提供自动缩进"
set smartindent

"继承前一行的缩进方式，特别适用于多注释"
set autoindent

"设置php,html,css,javascript的缩进"
autocmd FileType php,html,css,javascript set shiftwidth=4 | set expandtab | set tabstop=4

"列表模式，显示tab及行尾空格"
"set list"
"set lcs=tab:>-,trail:-"
