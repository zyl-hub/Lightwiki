" Vim plugin for markdown to make notes more tidy.
" Author: zyl-hub
" Last Change: 2020-08-25
" Version: 1.0
" Repository: https://github.com/zyl-hub/Lightwiki.git
" Lisence: MIT

if exists('g:LightWikiLoaded')
	finish
endif
let g:LightWikiLoaded = 1

command! -nargs=0 LightWikiMutiAction call s:mutiActionFunc()
command! -nargs=0 LightWikiVisualMutiAction call s:visualMutiActionFunc()
command! -nargs=0 LightWikiTodoList call s:todoList()

function! s:mutiActionFunc()
    if getline('.') == ''
        return 0
    elseif getline('.') =~ '^#\+ [..'
        execute "normal!^f(l"
        edit <cfile>
    else
        execute "normal!dawa [\<esc>pF[lli\<BS>\<esc>$a](\<esc>pF(lli\<BS>\<esc>$a) "
    endif
endfunction

function! s:visualMutiActionFunc()
    execute "normal!yyppi\<BS>\<esc>F#la[\<esc>f#i](\<esc>f#vf d$a.md) "
endfunction

func! s:todoList()
    if getline('.') == ''
        execute "normal!i- [ ] "
    elseif getline('.') =~ '^- [X\+'
        execute "normal!^f]a\<BS>\<BS> ]\<esc>$"
    else
        execute "normal!^f]a\<BS>\<BS>X]\<esc>$"
    endif
endfunction

nnoremap <LEADER>ww :e ~/vimwiki/index.md<CR>
autocmd Filetype markdown nnoremap <CR> :LightWikiMutiAction<CR>
autocmd Filetype markdown vnoremap <CR> :LightWikiVisualMutiAction<CR>
autocmd Filetype markdown nnoremap <BS> :w<CR>:bd<CR>
autocmd Filetype markdown nnoremap <TAB> /# [*<CR>:nohlsearch<CR>
autocmd Filetype markdown nnoremap <C-Space> :LightWikiTodoList<CR>
