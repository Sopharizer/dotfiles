autocmd VimEnter * execute 'Defx'
" open defx by Space-f
nnoremap <Space>f :<C-u>Defx .<CR>

call defx#custom#option('_', {
    \ 'columns': 'indent:git:icons:filename',
    \ 'show_ignored_files': 1,
    \ })

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2

function! s:open_defx_if_directory()
  " This throws an error if the buffer name contains unusual characters like
  " [[buffergator]]. Desired behavior in those scenarios is to consider the
  " buffer not to be a directory.
  try
    let l:full_path = expand(expand('%:p'))
  catch
    return
  endtry

  " If the path is a directory, delete the (useless) buffer and open defx for
  " that directory instead.
  if isdirectory(l:full_path)
    Defx `expand('%:p')`
  endif
endfunction

autocmd!

" It seems like BufReadPost should work for this, but for some reason, I can't
" get it to fire. BufEnter seems to be more reliable.
autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
      nnoremap <silent><buffer><expr> <CR>
     \ defx#do_action('open')
      nnoremap <silent><buffer><expr> o
     \ defx#do_action('open')
      nnoremap <silent><buffer><expr> s
     \ defx#do_action('open', 'split')
      nnoremap <silent><buffer><expr> v
     \ defx#do_action('open', 'vsplit')
      nnoremap <silent><buffer><expr> c
     \ defx#do_action('copy')
      nnoremap <silent><buffer><expr> m
     \ defx#do_action('move')
      nnoremap <silent><buffer><expr> p
     \ defx#do_action('paste')
      nnoremap <silent><buffer><expr> n
     \ defx#do_action('new_file')
      nnoremap <silent><buffer><expr> N
     \ defx#do_action('new_directory')
      nnoremap <silent><buffer><expr> d
     \ defx#do_action('remove')
      nnoremap <silent><buffer><expr> r
     \ defx#do_action('rename')
      nnoremap <silent><buffer><expr> t
     \ defx#do_action('open_or_close_tree')
      nnoremap <silent><buffer><expr> yy
     \ defx#do_action('yank_path')
      nnoremap <silent><buffer><expr> .
     \ defx#do_action('toggle_ignored_files')
      nnoremap <silent><buffer><expr> ..
     \ defx#do_action('cd', ['..'])
      nnoremap <silent><buffer><expr> <Esc>
     \ defx#do_action('quit')
      nnoremap <silent><buffer><expr> q
     \ defx#do_action('quit')
      nnoremap <silent><buffer><expr> <Space>
     \ defx#do_action('toggle_select') . 'j'
      nnoremap <silent><buffer><expr> *
     \ defx#do_action('toggle_select_all')
      nnoremap <silent><buffer><expr> j
     \ line('.') == line('$') ? 'gg' : 'j'
      nnoremap <silent><buffer><expr> k
     \ line('.') == 1 ? 'G' : 'k'
      nnoremap <silent><buffer><expr> <C-l>
     \ defx#do_action('redraw')
      nnoremap <silent><buffer><expr> <C-g>
     \ defx#do_action('print')
      nnoremap <silent><buffer><expr> cd
     \ defx#do_action('change_vim_cwd')
endfunction
autocmd BufEnter * call s:open_defx_if_directory()
