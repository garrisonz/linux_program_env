set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tenfyzhong/CompleteParameter.vim'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"	Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdcommenter'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

Plugin 'taketwo/vim-ros'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'vim-syntastic/syntastic'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'tpope/vim-commentary'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'

" for python
" Plugin 'nvie/vim-flake8'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"	Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"	Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"


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

" By. Tony
syntax enable
set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized

set number
set hlsearch

" turn off auto-indenting when paste
set pastetoggle=<F2>
" set paste

" start set 4 space for tab
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" end set 4 space for tab

set history=1000
set undofile
set undodir=/home/tony/.vimbackup/

let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Up> :bp<CR>
nnoremap <silent> <C-Down> :bn<CR>

let g:airline#extensions#tabline#enabled = 1

" start EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Default:
"   If a delimiter is in a highlight group whose name matches
"   any of the followings, it will be ignored.
let g:easy_align_ignore_groups = ['Comment', 'String']
" end EasyAlign

let g:ycm_semantic_triggers = { 'roslaunch' : ['="', '$(', '/'], 'rosmsg,rossrv,rosaction' : ['re!^', '/'],}
let g:ros_build_system = 'catkin_make'
let &makeprg = 'catkin_make' 

" start ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" end ultisnips

map <C-K> :pyf /usr/share/clang/clang-format-6.0/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format-6.0/clang-format.py<cr>

function! Formatonsave()
  :FormatCode
endfunction
autocmd BufWritePre *.hpp,*.h,*.cc,*.cpp call Formatonsave()


au VimEnter *  NERDTree

" set undodir=~/.vim/undodir
" set undofile   " Maintain undo history between sessions

let mapleader=","
" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>

" " start compelete parameter
" inoremap <silent><expr> ( complete_parameter#pre_complete("()")
" smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
" imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
" smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
" imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
" " end compelete parameter



" set conceallevel=2
" set concealcursor=vin
" let g:clang_snippets=1
" let g:clang_conceal_snippets=1
" " The single one that works with clang_complete
" let g:clang_snippets_engine='clang_complete'
" 
" " Complete options (disable preview scratch window, longest removed to aways
" " show menu)
" set completeopt=menu,menuone
" 
" " Limit popup menu height
" set pumheight=20
" 
" " SuperTab completion fall-back 
" let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

set splitbelow
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" toggle comment.
xnoremap <C-\> gc
nnoremap ,jd :YcmCompleter GoTo<CR>
"let g:syntastic_python_checkers = ['flake8']
"autocmd BufWritePost *.py call Flake8()
