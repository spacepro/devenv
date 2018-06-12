""""""""""""""""""""""
" install Vundle.vim
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
""""""""""""""""""""""
set nocompatible
filetype off

"""""" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 간지나는 상태바
Plugin 'vim-airline/vim-airline'
" vim에서 git쉽게 쓰기
Plugin 'tpope/vim-fugitive'
" 코드 변경내역 한눈에 확인
Plugin 'airblade/vim-gitgutter'
" NERDTree
Plugin 'scrooloose/nerdtree'
" 상태바에 코드 문법체크 표시
Plugin 'scrooloose/syntastic'
" https://vimawesome.com/plugin/ctrlp-vim-red
Plugin 'kien/ctrlp.vim'
" https://github.com/jacoborus/tender.vim
Plugin 'jacoborus/tender.vim'
" https://vimawesome.com/plugin/vim-javascript 
Plugin 'pangloss/vim-javascript'
" https://vimawesome.com/plugin/node
Plugin 'moll/vim-node'
" https://vimawesome.com/plugin/vim-cpp-enhanced-highlight
Plugin 'octol/vim-cpp-enhanced-highlight'
" https://vimawesome.com/plugin/json-vim
Plugin 'elzr/vim-json'
" https://vimawesome.com/plugin/youcompleteme
Plugin 'valloric/youcompleteme'
" https://vimawesome.com/plugin/vim-snippets
" Plugin 'honza/vim-snippets'
call vundle#end()
filetype plugin indent on

"""""" 단축키 지정
" NERDTree ON/OFF를 "\nt"로 설정
map <Leader>nt <ESC>:NERDTreeToggle<CR>

"""""" Plugin 세부설정
" set airline color theme
let g:airline_theme = 'tender'

" 상태바 브랜치옆 icon표시를 위한 폰트지정
let g:airline_powerline_fonts=1

" 파일찾기시 인덱싱으로 느려지는것 방지
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
\ }

" vim-snippets
autocmd FileType js UltiSnipsAddFiletypes javascript-jasmine

"""""" youcompleteme
" http://neverapple88.tistory.com/26
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_warning_symbol = '>*'

nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>gi :YcmCompleter GoToImprecise<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gy :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>

"""""" etc
" 시작시 파일 탐색기 실행
function! StartUp()
    NERDTree
    wincmd p
endfunction
"autocmd VimEnter * call StartUp()

" 컬러스킴 선택
colorscheme tender
" 투명한 배경 사용을 위해
hi Normal guibg=NONE ctermbg=NONE
" 자동 들여쓰기
set smartindent
" 검색어 강조
set hlsearch
" 줄번호 표시
set number
" 상대적 줄번호 표시 (jump to [line]j/k)
set relativenumber
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set expandtab
set smarttab
inoremap jk <ESC>

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" 커서 위치 기억
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal g`\"" |
\ endif
