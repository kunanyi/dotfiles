" Mapped keyboard shortcuts
let mapleader=","

set nocompatible
set mouse=a
set clipboard=unnamed

" Plug ins
call plug#begin('~/.vim/plugged')
	Plug 'prettier/vim-prettier', {
		\ 'do': 'yarn install',
		\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }
		let g:prettier#autoformat = 0
		autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
		let g:prettier#config#use_tabs = 'true'
		let g:prettier#config#bracket_spacing = 'true'
		let g:prettier#config#print_width = 800000
	Plug 'w0rp/ale'
	Plug 'jiangmiao/auto-pairs'
	Plug 'Yggdroot/LeaderF'
	Plug 'terryma/vim-smooth-scroll'
	Plug 'gregsexton/MatchTag'
	Plug 'matze/vim-move'
	Plug 'justinmk/vim-sneak'
	"Plug 'ap/vim-buftabline'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-fugitive'
	Plug 'gregsexton/gitv', {'on': ['Gitv']}
	Plug 'junegunn/vim-easy-align'
	Plug 'junegunn/vim-github-dashboard'
	Plug 'jreybert/vimagit'
	Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
	Plug 'godlygeek/tabular'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'docunext/closetag.vim'
	Plug 'nanotech/jellybeans.vim'
	Plug 'morhetz/gruvbox'
	Plug 'zweifisch/pipe2eval'
	Plug 'nathanaelkane/vim-indent-guides'
		let g:indent_guides_space_guides = 0
		let g:indent_guides_color_change_percent = 5
		let g:indent_guides_tab_guides = 1
		autocmd VimEnter * :IndentGuidesEnable
	Plug 'airblade/vim-gitgutter'
		let g:gitgutter_enabled = 0
	Plug 'scrooloose/nerdtree'
		let g:NERDTreeMapJumpNextSibling = ''
		nmap <leader>d :NERDTreeToggle<CR>
		nmap <leader>f :NERDTreeFind<CR>
		let g:NERDSpaceDelims=1
		let g:NERDTreeIgnore=['node_modules$[[dir]]']
		let g:miniBufExplModSelTarget = 1
		let NERDTreeQuitOnOpen = 1
		set switchbuf=useopen,usetab
	Plug 'xuyuanp/nerdtree-git-plugin'
	Plug 'adelarsq/vim-hackernews'
	Plug 'junegunn/goyo.vim'
		map <C-E> :set wrap!<cr>:Goyo<cr>
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
		"nnoremap <c-t> :FZF<cr>
		" Line completion http://sts10.github.io/blog/2016/01/09/vim-line-complete-with-fzf/
		"imap <C-c> <plug>(fzf-complete-line)
		"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
	"Plug 'itchyny/vim-cursorword'
	Plug 'itchyny/vim-gitbranch'
	Plug 'ap/vim-css-color'
	Plug 'moll/vim-bbye'
	Plug 'groenewege/vim-less'
	Plug 'chrisbra/csv.vim'
	Plug 'elzr/vim-json'
		let g:vim_json_syntax_conceal = 0
	Plug 'jiangmiao/simple-javascript-indenter'
	Plug 'jelera/vim-javascript-syntax'
	Plug 'rhlobo/vim-super-retab'
	Plug 'vim-scripts/restore_view.vim'
	"Plug 'ap/vim-buftabline'
call plug#end()




set nobackup
set nowrap
set linebreak
set textwidth=0
set wrapmargin=0
set backspace=2 " make backspace work like most other apps
set hidden
set ignorecase " ignore case when searching
set wildmode=longest:full
set ruler " show cursor position
set cursorline
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set laststatus=2
set statusline=%<%f%=\ [%m%r%h%y]\ (%(%l,%c%))
set number " always show line numbers
set hlsearch " highlight search terms
set incsearch " show search matches as you type
set history=100 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title  " change the terminal's title
set noswapfile
set cindent
set cinkeys-=0#
set updatetime=250 " helpful for git-gutter
set showcmd
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set wildmode=longest,list,full " tab completion
set wildmenu

" filetype plugin on
filetype off
filetype indent plugin on


" centre cursor on screen https://hackr.pl/2017/01/11/some-of-my-favorite-vimrc-edits/
set so=999
nmap <leader>m :set so=999<cr>
nmap <leader><leader>m :set so=0<cr>

" This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" Search-replace word under cursor http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor#Mapping
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" Buffer shortcuts
let g:BASH_Ctrl_j = 'off'
nnoremap <C-b> :buffers<CR>

" Remap ; to : for laziness https://hackr.pl/2017/01/11/some-of-my-favorite-vimrc-edits/
" nnoremap ; :

" Persistent undo https://jovicailic.org/2017/04/vim-persistent-undo/
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Ctrl-h/l for buffer navigation
augroup vimrc
	au!
	au VimEnter * unmap <C-l>
	au VimEnter * unmap <C-h>
	au vimenter * noremap <C-l> :bnext<CR>
	au vimenter * noremap <C-h> :bprev<CR>
augroup END

" Bubble single lines
vnoremap <C-k> ddkP
vnoremap <C-j> ddp

" Bubble multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]`]]`

" Wrapped text counts as multiple lines when wrapping
nnoremap j gj
nnoremap k gk

" Disable arrow keys when editing
inoremap        <Up>     <NOP>
inoremap        <Down>   <NOP>
inoremap        <Left>   <NOP>
inoremap        <Right>  <NOP>
noremap         <Up>     <NOP>
noremap         <Down>   <NOP>
noremap         <Left>   <NOP>
noremap         <Right>  <NOP>

" https://github.com/moll/vim-bbye
" http://stackoverflow.com/questions/4115841/remapping-wq-to-save-and-close-buffer-instead-of-save-and-quit
cnoreabbrev bd Bdelete

" Splits movement http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" https://coderwall.com/p/1ipsrg/copy-current-file-path-in-vim
nnoremap ,c :let @* = expand("%:p").":".line('.')<cr>

" Resize current buffer by +/- 1 - http://stackoverflow.com/questions/4368690/how-to-increase-the-vertical-split-window-size-in-vim
nnoremap <silent> + :exe "res +1"<CR>
nnoremap <silent> - :exe "res -1"<CR>

" Folds
:noremap <leader>zz zf%
:noremap zz za
function! NeatFoldText() "function! NeatFoldText()
	let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
	let lines_count = v:foldend - v:foldstart + 1
	let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
	let foldchar = matchstr(&fillchars, 'fold:\zs.')
	let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
	let foldtextend = lines_count_text . repeat(foldchar, 8)
	let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
	return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

" Paste https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction

" Colours
syntax enable
set background=dark
"color jellybeans
"color gruvbox
"colorscheme gruvbox
colorscheme jellybeans

" Italics for Operator Mono
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic
hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic




" ## FZF

let g:fzf_command_prefix = 'Fz'
let g:fzf_commands_expect = 'alt-enter'
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <silent> <leader>f :call <SID>open_fzf()<CR>

function! s:open_fzf()
  let l:commands= [ 'Files', 'Buffers', 'BLines', 'Ag', 'Commands', 'GFiles?', 'GCheckout', 'History', 'Tags', 'BTags' ]
  let l:choices = [ '&files', '&buffers', '&lines', '&ag', '&commands', 'git &status', '&git checkout', '&history', '&tags', 'buffer &Tags' ]
  let l:choice = confirm('Complete', join(l:choices, "\n"))
  if l:choice != 0
    execute ':Fz'.l:commands[l:choice - 1]
  endif
endfunction

augroup fzfMappingsAu
  autocmd!
  autocmd FileType fzf tnoremap <buffer> <silent> <C-f>
    \ <C-\><C-n>:close<CR>
    \ :sleep 50m<CR>
    \ :call <SID>open_fzf()<CR>
augroup END

function! s:open_branch_fzf(line)
  let l:parser = split(a:line)
  let l:branch = l:parser[0] ==? '*' ? l:parser[1] : l:parser[0]
  execute 'terminal git checkout ' . l:branch
  call feedkeys('i', 'n')
endfunction

function! s:show_branches_fzf(bang)
  let l:current = system('git symbolic-ref --short HEAD')
  let l:current = substitute(l:current, '\n', '', '')
  call fzf#vim#grep(
    \ "git branch -v | sed -r -e '/^\\*/d' -e 's/^\\s*//'", 0,
    \ { 'sink': function('s:open_branch_fzf'), 'options': ['--no-multi', '--header='.l:current] }, a:bang)
endfunction

command! -bang -nargs=0 FzGCheckout call <SID>show_branches_fzf(<bang>0)
