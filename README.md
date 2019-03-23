# brightscript.vim
Vim/Neovim syntax highlighting and formatting for the BrightScript language.

Original credits to [Dylan Doxey](http://dylan.doxey.org/article/64/roku-brightscript-syntax-highlighting-in-vim) and @chooh.

## Installation
Depends on your plugin manager, but it should be pretty similar to one of these:

### vim-plug
```vim
Plug 'sjbarag/brightscript.vim
```

### Dein
```vim
call dein#add('sjbarag/brightscript.vim')
```

## Hacking
Instructions provided for `vim-plug`.  I assume similar steps apply to other plugin managers.

1. Replace `Plug 'sjbarag/brightscript.vim'` in `.vimrc`/`init.vim` with `Plug '/path/to/this/repo'`
2. Run `:PlugClean` and `:PlugInstall` to install the local copy
3. Open a BrightScript file!  Rerun `:PlugInstall` to load the latest changes on the next `vim` start
4. Set breakpoints with something like `[n]vim someFile.brs -c "breakadd func 10 GetBrightscriptIndent"`
