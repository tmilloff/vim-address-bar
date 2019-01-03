" Exit if already loaded or if compatible mode is turned on
if exists("g:loaded_address_bar") || &cp
  finish
endif
let g:loaded_address_bar = 1
let s:address_bar_open = 0

function! AddressBar()
  " Don't do anything if the buffer is already open
  if s:address_bar_open == 1
    echom 'Address bar is already open'
    return
  endif
  " Grab the path of the file we're currently in
  let s:address_bar_open = 1
  let s:path = expand('%')
  " Open a new split 1 row high
  1new
  " Make the new buffer a scratch buffer
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  " Set the buffer name, mostly just a visual thing
  file Address Bar
  " Automatically close and unload the buffer when we leave it
  augroup AutoClose
    autocmd!
    autocmd BufLeave <buffer> let s:address_bar_open = 0 | bdelete!
  augroup END
  " Close the buffer and edit the file at the path under cursor when pressing Enter
  nnoremap <silent> <buffer> <cr> :call CloseAndGoToFile()<cr>
  " Close the buffer when pressing Esc or Ctrl-C
  nnoremap <buffer> <esc> :bdelete!<cr>
  nnoremap <buffer> <c-c> :bdelete!<cr>
  " Type the path into the scratch buffer
  call feedkeys('i'.s:path."\<esc>")
endfunction

function! CloseAndGoToFile()
  " Grab the path
  let s:path = getline('.')
  " Close the scratch buffer
  bdelete!
  " Go to the path
  execute 'edit' s:path
endfunction

" Omitted ! flag as to not overwrite a user's command if it exists
command AddressBar call AddressBar()
