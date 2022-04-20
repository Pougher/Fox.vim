highlight clear
if exists("syntax_on")
    syntax reset
endif


" Colors
let axolotlfox_background = "#282828"
let axolotlfox_whitered = [axolotlfox_background, '#cfb9b6']
let axolotlfox_grayred = [axolotlfox_background, '#4a403e']
let axolotlfox_green = [axolotlfox_background, '#9fde4e']
let axolotlfox_sunset = [axolotlfox_background, '#ffd747']
let axolotlfox_tulip = [axolotlfox_background, '#f7643b']

set background=dark
let g:colors_name='axolotlfox'

function! GuiFor(group, ...)
     let histring = 'hi ' . a:group . ' '

    if strlen(a:1)
        let histring .= 'guibg=' . a:1 . ' '
    endif

    if strlen(a:2)
        let histring .= 'guifg=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let histring .= 'gui=' . a:3 . ' '
    endif

    execute histring
endfunction

function! GuiSet(group, col, style)
    call GuiFor(a:group, a:col[0], a:col[1], a:style)
endfunction

" General Syntax highlighting
call GuiSet('Normal', axolotlfox_whitered, '')
call GuiSet('LineNr', axolotlfox_grayred, '')

" VimScript syntax highlighting
call GuiSet('vimString', axolotlfox_green, '')

" C syntax highlighting
call GuiSet('cString', axolotlfox_green, '')
call GuiSet('cType', axolotlfox_sunset, 'italic')
call GuiSet('cStatement', axolotlfox_tulip, '')
