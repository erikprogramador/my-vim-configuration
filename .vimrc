colorscheme hybrid_reverse
set shell=/bin/zsh
set nonumber
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set background=dark
set incsearch
set linespace=25
set splitbelow
set splitright
set foldcolumn=2
set autowrite
hi LineNr ctermbg=bg
hi foldcolumn ctermbg=bg
hi vertsplit ctermbg=bg ctermfg=bg

let g:enable_bold_font=1

"---------------------Mappings--------------"
nmap ,ev :tabedit $MYVIMRC<cr>
nmap ,es :e ~/.vim/snippets/
nmap ,f :tag<space>
nmap ,ct :!ctags -R --exclude=.git --exclude=node_modules<cr>
vmap ,su ! awk '{print length(), $0 \| "sort -n \| cut -d \" \" -f2-" }'<cr>
nmap ,t :!clear && vendor/bin/phpunit<cr>
nmap ,tf :!clear && vendor/bin/phpunit %<cr>
nmap ,tm yiw:!clear && vendor/bin/phpunit --filter <C-R>"<cr>
nmap ,td :!clear && vendor/bin/phpunit --testdox<cr>
nmap ,dk :!clear && php artisan dusk<cr>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
nmap <F7> mzgg=G`z`

vmap ,cm :'<,'>norm i//<cr>
vmap ,cum :'<,'>norm xx<cr>

"---------------------Plugins--------------"
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'

let NERDTreeHijackNetrw = 0

let g:php_cs_fixer_level = "psr2"

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap ,d :call pdv#DocumentWithSnip()<CR>

let g:UltiSnipsExpandTrigger="<tab-d>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"---------------------Plugins Maimps--------------"

nmap <C-b> :NERDTreeToggle<cr>
nmap <c-R> :CtrlPBufTag<cr>
nmap <C-D> :t .<cr>
nnoremap ,pf :call PhpCsFixerFixFile()<CR>

"---------------------Auto command--------------"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

augroup trailing
    autocmd!
    autocmd BufWritePre *.py :%s/\s\+$//e
augroup END

function! GoyoAfter()
    Limelight!
    set background=dark
    colorscheme atom-dark-256
endfunction

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap ,n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap ,n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap ,nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap ,nf :call PhpExpandClass()<CR>

if &term =~ '256color'
    set t_ut=
endif

"---------------------Vundle--------------"
set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim         " Source the plugins file

"---------------------Helpers--------------"

" m                 Manage files on the NerdTree
" ,d                Create comment to a method
" -                 Show content folder
" d                 Create a new directory
" CTRL + w + |      Expand a split
" CTRL + w + =      Make the splits equals
" D                 Delete a file or directory
" %                 Create a new file
" zc                Close a block of code
" za                Open a block of code
" ds                Delete surround
" dst               Delete surround tag
" cst               Change surround tag
" S (Capital)       Surround
" CTRL + ]          Go to method definition
" :ls               Show buffer list
" :b $buffernum     Go to the buffer
" 0                 Start of line
" $                 End of line
" dat               Delete a tag

