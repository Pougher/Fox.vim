" Requires a true color (24-bit) terminal
" E.g. Alacritty

highlight clear
if exists("syntax_on")
    syntax reset
endif

" Colors
let fox_background = "#282828"

let fox_whitered             = [ fox_background, '#ebd8b0' ]
let fox_grayred              = [ fox_background, '#4a403e' ]
let fox_green                = [ fox_background, '#b4bb26' ]
let fox_sunset               = [ fox_background, '#f5bf2a' ]
let fox_tulip                = [ fox_background, '#f7643b' ]
let fox_fireorange           = [ fox_background, '#e0882f' ]
let fox_coral                = [ fox_background, '#d38697' ]
let fox_lightgray            = [ fox_background, '#6a6a6a' ]
let fox_sky                  = [ fox_background, '#56a5b0' ]
let fox_brightgray           = [ fox_background, '#b7b7b7' ]
let fox_aqua                 = [ fox_background, '#5cc4ae' ]

let fox_white_lgbg           = [ '#6a6a6a', fox_whitered[1] ]

set background=dark
let g:colors_name='fox'

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
call GuiSet('Normal', fox_whitered, '')
call GuiSet('LineNr', fox_grayred, '')

hi NonText guifg=bg
hi MatchParen cterm=NONE gui=NONE guifg=lightgray guibg=gray

" ============================================================================
" VimScript syntax highlighting
" ============================================================================

call GuiSet('vimString', fox_green, '')
call GuiSet('vimGroupTitle', fox_aqua, '')
call GuiSetGroups([ 'vimHiGroup', 'vimNumber' ], fox_coral)
call GuiSetGroups([ 'vimLineComment', 'vimComment' ], fox_lightgray)
call GuiSetGroups([ 'vimLet', 'vimCommand', 'vimNotFunc' ], fox_tulip)
call GuiSetGroups([ 'vimVar', 'vimOper', 'vimFuncVar' ], fox_whitered)
call GuiSetGroups([ 'vimFuncName', 'vimUserFunc', 'vimFunction' ], fox_fireorange)
call GuiSetGroups([ 'vimOption',
            \'vimNotation',
            \'vimContinue',
            \'vimSynType',
            \'vimHiAttrib',
            \'vimHiGuiFgBg',
            \'vimGroupName',
            \'vimGroup' ],
            \fox_sky)
call GuiSetGroups([ 'vimHiCTerm', 'vimHiGui', 'vimHiGuiFgBg' ], fox_brightgray)

" ============================================================================
" C syntax highlighting
" ============================================================================

call GuiSet('cComment', fox_lightgray, '')
call GuiSet('cFormat', fox_brightgray, '')

call GuiSetGroups([ 'cCustomFunc', 'cOperator' ], fox_fireorange)
call GuiSetGroups([ 'cString', 'cCharacter' ], fox_green)
call GuiSetGroups([ 'cType', 'cCustomClass' ], fox_sunset)
call GuiSetGroups([ 'cUserLabel', 'cTypedef' ], fox_aqua)
call GuiSetGroups([ 'cPreProc', 'cPreCondit', 'cInclude', 'cDefine' ], fox_sky)
call GuiSetGroups([ 'cNumber', 'cOctal', 'cOctalZero' ], fox_coral)
call GuiSetGroups([ 'cStorageClass',
            \'cStructure',
            \'cConditional',
            \'cStatement',
            \'cRepeat',
            \'cLabel' ],
            \fox_tulip)

" ============================================================================
" JavaScript syntax highlighting
" ============================================================================

call GuiSet('javaScriptNumber', fox_coral, '')
call GuiSet('javaScriptNull', fox_sky, '')

call GuiSetGroups([ 'javaScriptBraces' ], fox_whitered)
call GuiSetGroups([ 'javaScriptFunction' ], fox_aqua)
call GuiSetGroups([ 'javaScriptBranch', 'javaScriptReserved', 'javaScriptException', 'javaScriptConiditional', 'javaScriptRepeat', 'javaScriptStatement' ], fox_tulip)
call GuiSetGroups([ 'javaScriptStringS', 'javaScriptStringD' ], fox_green)
call GuiSetGroups([ 'javaScriptIdentifier' ], fox_sunset)
call GuiSetGroups([ 'javaScriptLineComment', 'javaScriptComment' ], fox_lightgray)

" ============================================================================
" TypeScript syntax highlighting
" ============================================================================

call GuiSetGroups([ 'typescriptNumber', 'typescriptNull', 'typescriptBoolean' ], fox_coral)
call GuiSetGroups([ 'typescriptCall', 'typescriptBraces', 'typescriptFuncComma' ], fox_whitered)
call GuiSetGroups([ 'typescriptComment', 'typescriptLineComment' ], fox_lightgray)
call GuiSetGroups([ 'typescriptImport',
            \'typescriptExceptions',
            \'typescriptStatementKeyword',
            \'typescriptRepeat',
            \'typescriptConditional',
            \'typescriptConditionalElse',
            \'typescriptCase',
            \'typescriptBranch',
            \'typescriptOperator',
            \'typescriptInterfaceKeyword',
            \'typescriptNodeGlobal',
            \'typescriptClassKeyword' ],
            \fox_tulip)
call GuiSetGroups([ 'typescriptString' ], fox_green)
call GuiSetGroups([ 'typescriptGlobal', 'typescriptVariable', 'typescriptInterfaceName', 'typescriptMember' ], fox_sunset)
call GuiSetGroups([ 'typescriptTypeReference', 'typescriptIdentifier', 'typescriptAliasKeyword', 'typescriptPredefinedType' ], fox_sky)
call GuiSetGroups([ 'typescriptFuncKeyword' ], fox_aqua)
call GuiSetGroups([ 'typescriptFuncName' ], fox_fireorange)

" ============================================================================
" C++ syntax highlighting
" ============================================================================

call GuiSet('cppString', fox_green, '')
call GuiSet('cppOperator', fox_fireorange, '')
call GuiSet('cppType', fox_sunset, '')

call GuiSetGroups([ 'cppExceptions',
            \'cppStatementKeyword',
            \'cppRepeat',
            \'cppConditional',
            \'cppConditionalElse',
            \'cppCase',
            \'cppBranch',
            \'cppOperator',
            \'cppInterfaceKeyword',
            \'cppClassKeyword' ],
            \fox_tulip)
call GuiSetGroups([ 'cppModule',
            \'cppStorageClass',
            \'cppModifier',
            \'cppCast' ],
            \fox_aqua)
call GuiSetGroups([ 'cppAccess',
            \'cppStructure',
            \'cppStatement' ],
            \fox_sky)
call GuiSetGroups([ 'cppConstant',
            \'cppNumber',
            \'cppBoolean' ],
            \fox_coral)

" ============================================================================
" Ruby syntax highlighting
" ============================================================================

