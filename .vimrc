" Enable Mouse
set mouse=a

" Show line numbers in left margin
set number

" Highlight the line the cursor is on
set cursorline

" Enable syntax highlighting
syntax on

" Set tab width to 
set tabstop=4
set shiftwidth=4

" Start searching while still typing
set incsearch

" Use highlighting during a search
set hlsearch

" Make sure the mode is displayed at the bottom of the screen
set showmode

" Set the number of commands to save in the history
set history=100

" Always show the status line and update what is shown
set laststatus=2
set statusline=%f\ %h%w%m%r%=%-14.(%{mode()}\ %l,%c%V%)\ %P

" Mode Indication -Prominent!
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=Yellow
  elseif a:mode == 'r'
    hi statusline ctermfg=Red
  else
    hi statusline ctermfg=Magenta
  endif
endfunction

function! InsertLeaveActions()
  hi statusline ctermfg=Cyan
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

" to handle exiting insert mode via a control-C
inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>

" default the statusline to green when entering Vim
hi statusline ctermfg=Cyan
