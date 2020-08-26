# Lightwiki

Vim plugin for markdown file to make notes tidier

## Usage

### Enter

- Normal

    1. create link with the word under cursor

    2. follow link

    3. create file if linked file doesn't exist

- Visual

    create link with current line

### Tab

- Nomal

    go to next link

### Backspace


``` vimscript
" if you want use <BS> in normal mode to kill current buffer
" default 0
let g:ApplyBSkillBuffer = 1
```

- Normal

    Use with airline tabeline

    Kill and save current buffer
