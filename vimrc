" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'vim-scripts/autoload_cscope.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'chazy/cscope_maps'
Plugin 'fugalh/desert.vim'
Plugin 'vim-scripts/peaksea'
Plugin 'vim-scripts/desertEx'
Plugin 'tpope/vim-fugitive'
" Plugin 'ervandew/supertab'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'milkypostman/vim-togglelist'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ctrlp options
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_open_multiple_files = 'i'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
map ,b :CtrlPBuffer<CR>
map ,m :CtrlPMRU<CR>
map ,s :CtrlPTag<CR>

" nerdtree options
map <C-n> :NERDTreeToggle<CR>

" taglist options
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
map <F5> :TlistToggle<CR>
imap <F5> <ESC>:TlistToggle<CR>
map ,t :TlistToggle<CR>

" OmniCppComplete options
set nocp
filetype plugin on 
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MayCompleteScope=1
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DefaultNamespace=["std"]
let OmniCpp_ShowPrototypeInAbbr=1
let OmniCpp_SelectFirstItem=2
imap <F7> <C-x><C-o>

" bufexplorer options
let g:bufExplorerShowRelativePath=1
map <F8> :ToggleBufExplorer<CR>
"map <Leader>e :ToggleBufExplorer<CR>
map ,e :ToggleBufExplorer<CR>

" Ggr-> refine Fugitive's Ggrep
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!

"cscope quickfix
set cscopequickfix=s-,c-,d-,i-,t-,e-

"Mouse
"set mouse=a

"Line num
set nu

"high light search
set hlsearch

"Ctag
set tags=tags;

"Switch tab
map <F9> :tabn<CR>

"Switch buffers
nnoremap <F6> :buffers<CR>:buffer<Space>

"Auto indent
set cindent

"Set search highlight
set hls

"Set color scheme
if &diff
	colors peaksea
	colors desertEx
else
	colors desert
endif

"Show status line
set ls=2
hi StatusLine ctermbg=Cyan ctermfg=black

"Set fold method
set fdm=syntax
set nofoldenable

"long line warning ( > 80 charactors)
highlight ColorColumn ctermbg=blue guibg=blue
set textwidth=80
set colorcolumn=+1

"alias
ab grepc grep -r --include "*.[chsS]"
ab grepm grep -r --include "Makefile" --include "makefile" --include "*.mk" --include "Kconfig"
ab mku !./make_uboot.sh
ab mkk !./make_kernel.sh

"display extra whitespace
"set list listchars=tab:»·,trail:·

"exrc for different directory, must in the end of .vimrc
set exrc
set secure
