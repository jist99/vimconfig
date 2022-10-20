"Tab config
set tabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set autoindent

"Line config
set nowrap
set number relativenumber

"""Visuals
"Theme
set background=dark
colorscheme one

"Statusline - vimscript for git branchname
let g:branchname = ''

fun! GitBranch()
	let l:output = system("git rev-parse --abbrev-ref HEAD")
	return l:output[0:strlen(l:output)-2] "Remove the tailing ^@
endfun

fun! StatuslineGit()
	let g:branchname = g:branchname[0:4] != "fatal"?g:branchname:'[No Branch]'
	return '  '.g:branchname.' '
endfun

let g:branchname = GitBranch() "Initial call
autocmd BufRead * :let g:branchname = GitBranch()

"Statusline - main config
set statusline=
set statusline+=%#Cursor#
set statusline+=%{StatuslineGit()}
set statusline+=%#StatusLineNc#
set statusline+=\ %f
set statusline+=%m%=
set statusline+=%#DiffText#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %l:%c\ 


"""Languages
"Markdown
set conceallevel=2
