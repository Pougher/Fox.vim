" Requires a true color (24-bit) terminal
" E.g. Alacritty

highlight clear
if exists("syntax_on")
    syntax reset
endif

" Colors
let axolotlfox_background = "#282828"

let axolotlfox_whitered             = [ axolotlfox_background, '#ebd8b0' ]
let axolotlfox_grayred              = [ axolotlfox_background, '#4a403e' ]
let axolotlfox_green                = [ axolotlfox_background, '#b4bb26' ]
let axolotlfox_sunset               = [ axolotlfox_background, '#f5bf2a' ]
let axolotlfox_tulip                = [ axolotlfox_background, '#f7643b' ]
let axolotlfox_fireorange           = [ axolotlfox_background, '#e0882f' ]
let axolotlfox_coral                = [ axolotlfox_background, '#d38697' ]
let axolotlfox_lightgray            = [ axolotlfox_background, '#6a6a6a' ]
let axolotlfox_sky                  = [ axolotlfox_background, '#56a5b0' ]
let axolotlfox_brightgray           = [ axolotlfox_background, '#b7b7b7' ]
let axolotlfox_aqua                 = [ axolotlfox_background, '#5cc4ae' ]

let axolotlfox_white_lgbg           = [ '#6a6a6a', axolotlfox_whitered[1] ]

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
    " Function to set the colour of one group
    call GuiFor(a:group, a:col[0], a:col[1], a:style)
endfunction

function! GuiSetGroups(groups, col)
    " Function to set multiple groups at once
    for i in a:groups
        call GuiSet(i, a:col, '')
    endfor
endfunction

" General Syntax highlighting
call GuiSet('Normal', axolotlfox_whitered, '')
call GuiSet('LineNr', axolotlfox_grayred, '')

hi NonText guifg=bg
hi MatchParen cterm=NONE gui=NONE guifg=lightgray guibg=gray

" ============================================================================
" VimScript syntax highlighting
" ============================================================================

call GuiSet('vimString', axolotlfox_green, '')
call GuiSet('vimGroupTitle', axolotlfox_aqua, '')
call GuiSetGroups([ 'vimHiGroup', 'vimNumber' ], axolotlfox_coral)
call GuiSetGroups([ 'vimLineComment', 'vimComment' ], axolotlfox_lightgray)
call GuiSetGroups([ 'vimLet', 'vimCommand', 'vimNotFunc' ], axolotlfox_tulip)
call GuiSetGroups([ 'vimVar', 'vimOper', 'vimFuncVar' ], axolotlfox_whitered)
call GuiSetGroups([ 'vimFuncName', 'vimUserFunc', 'vimFunction' ], axolotlfox_fireorange)
call GuiSetGroups([ 'vimOption',
            \'vimNotation',
            \'vimContinue',
            \'vimSynType',
            \'vimHiAttrib',
            \'vimHiGuiFgBg',
            \'vimGroupName',
            \'vimGroup' ],
            \axolotlfox_sky)
call GuiSetGroups([ 'vimHiCTerm', 'vimHiGui', 'vimHiGuiFgBg' ], axolotlfox_brightgray)

" ============================================================================
" C syntax highlighting
" ============================================================================

call GuiSet('cString', axolotlfox_green, '')
call GuiSet('cCustomFunc', axolotlfox_fireorange, '')
call GuiSet('cComment', axolotlfox_lightgray, '')
call GuiSet('cFormat', axolotlfox_brightgray, '')
call GuiSet('cTypedef', axolotlfox_aqua, '')
call GuiSet('cType', axolotlfox_sunset, '')

call GuiSetGroups([ 'cInclude', 'cDefine' ], axolotlfox_sky)
call GuiSetGroups([ 'cNumber', 'cOctal', 'cOctalZero' ], axolotlfox_coral)
call GuiSetGroups([ 'cStructure', 'cConditional', 'cStatement', 'cRepeat', 'cLabel' ], axolotlfox_tulip)

" ============================================================================
" JavaScript syntax highlighting
" ============================================================================

call GuiSet('javaScriptNumber', axolotlfox_coral, '')

call GuiSetGroups([ 'javaScriptBraces' ], axolotlfox_whitered)
call GuiSetGroups([ 'javaScriptFunction' ], axolotlfox_aqua)
call GuiSetGroups([ 'javaScriptReserved', 'javaScriptException', 'javaScriptConiditional', 'javaScriptRepeat', 'javaScriptStatement' ], axolotlfox_tulip)
call GuiSetGroups([ 'javaScriptStringS', 'javaScriptStringD' ], axolotlfox_green)
call GuiSetGroups([ 'javaScriptIdentifier' ], axolotlfox_sunset)
call GuiSetGroups([ 'javaScriptLineComment', 'javaScriptComment' ], axolotlfox_lightgray)

" ============================================================================
" TypeScript syntax highlighting
" ============================================================================

call GuiSetGroups([ 'typescriptCall', 'typescriptBraces', 'typescriptFuncComma' ], axolotlfox_whitered)
call GuiSetGroups([ 'typescriptComment', 'typescriptLineComment' ], axolotlfox_lightgray)
call GuiSetGroups([ 'typescriptImport', 'typescriptExceptions', 'typescriptStatementKeyword', 'typescriptRepeat', 'typescriptConditional' ], axolotlfox_tulip)
call GuiSetGroups([ 'typescriptString' ], axolotlfox_green)
call GuiSetGroups([ 'typescriptGlobal', 'typescriptVariable' ], axolotlfox_sunset)
call GuiSetGroups([ 'typescriptTypeReference' ], axolotlfox_sky)
call GuiSetGroups([ 'typescriptFuncKeyword' ], axolotlfox_aqua)
call GuiSetGroups([ 'typescriptFuncName' ], axolotlfox_fireorange)

