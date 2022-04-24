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

function! GuiSetN(group, col)
    call GuiSet(a:group, a:col, '')
endfunction

function! GuiSetGroups(groups, col)
    " Function to set multiple groups at once
    for i in a:groups
        call GuiSet(i, a:col, '')
    endfor
endfunction

" Colours: {{{

call GuiSetN('FoxGreen', fox_green)
call GuiSetN('FoxBlue', fox_sky)
call GuiSetN('FoxYellow', fox_sunset)
call GuiSetN('FoxOrange', fox_fireorange)
call GuiSetN('FoxRed', fox_tulip)
call GuiSetN('FoxPurple', fox_coral)
call GuiSetN('FoxBright', fox_brightgray)
call GuiSetN('FoxGray', fox_lightgray)
call GuiSetN('FoxNormal', fox_whitered)
call GuiSetN('FoxAqua', fox_aqua)
call GuiSetN('FoxGrayRed', fox_grayred)

" }}}

" General: {{{
hi! link Normal FoxNormal
hi! link LineNr FoxGrayRed

hi! link Comment FoxGray
hi! link Statement FoxRed
hi! link Type FoxYellow 
hi! link PreProc FoxBlue
hi! link String FoxGreen
hi! link Function FoxAqua
hi! link Number FoxPurple
hi! link Constant FoxAqua
hi! link Structure FoxAqua
hi! link Float FoxPurple
hi! link PreCondit FoxBlue
hi! link Character FoxGreen
hi! link Include FoxBlue
hi! link Define FoxBlue
hi! link Macro FoxBlue
hi! link Keyword FoxRed
hi! link Conditional FoxRed
hi! link Repeat FoxRed
hi! link Special FoxRed

hi Normal guibg=#282828 guifg=#ebd8b0
hi NonText guifg=bg
hi MatchParen cterm=NONE gui=NONE guifg=lightgray guibg=gray

" }}}

" VimScript: {{{

hi! link vimGroupTitle FoxAqua
hi! link vimHiGroup FoxPurple
hi! link vimVar FoxNormal
hi! link vimOper FoxNormal
hi! link vimFuncVar FoxNormal
hi! link vimFunction FoxOrange
hi! link vimContinue FoxBlue
hi! link vimUserFunc FoxOrange
hi! link vimGroup FoxBlue
hi! link vimParenSep Normal

" }}}

" C: {{{

hi! link cFormat FoxBrightGray
hi! link cCustomFunc FoxOrange
hi! link cTypedef FoxAqua
hi! link cStructure FoxRed

" }}}

" JavaScript: {{{

hi! link javaScriptNull FoxPurple
hi! link javaScriptBraces FoxNormal
hi! link javaScriptNumber FoxPurple
hi! link javaScriptIdentifier FoxYellow
hi! link javaScriptMember FoxBlue

" }}}

" TypeScript: {{{

hi! link typescriptMember FoxOrange
hi! link typescriptOperator FoxRed
hi! link typescriptFuncComma FoxNormal
hi! link typescriptCall FoxNormal
hi! link typescriptBraces FoxNormal
hi! link typescriptNull FoxPurple
hi! link typescriptFuncName FoxOrange
hi! link typescriptTypereference FoxBlue
hi! " Json: {{{

hi! link jsonKeyword GruvboxGreen
hi! link jsonQuote GruvboxGreen
hi! link jsonBraces GruvboxFg1
hi! link jsonString GruvboxFg1

" }}}link typescriptIdentifier FoxSky
hi! link typescriptGlobal FoxYellow
hi! link typescriptVariable FoxYellow
hi! link typescriptInterfaceName FoxYellow
hi! link typescriptFuncKeyword FoxAqua

" }}}

" C++: {{{
" Json: {{{

hi! link jsonKeyword GruvboxGreen
hi! link jsonQuote GruvboxGreen
hi! link jsonBraces GruvboxFg1
hi! link jsonString GruvboxFg1

" }}}
hi! link cppAccess FoxBlue
hi! link cppStructure FoxBlue
hi! link cppStatement FoxBlue

" }}}

" Ruby: {{{

hi! link rubyNil FoxPurple
hi! link rubyOperator FoxOrange
hi! link rubySymbol FoxOrange
hi! link rubyMethodName FoxOrange
hi! link rubyClassDeclaration FoxOrange
hi! link rubyDefine FoxAqua
hi! link rubyMethod FoxAqua
hi! link rubyStringDelimiter FoxGreen
hi! link rubyInstanceVariable FoxBlue

" }}}

" Clojure: {{{

hi! link clojureKeyword FoxBlue
hi! link clojureCond FoxOrange
hi! link clojureSpecial FoxOrange
hi! link clojureDefine FoxOrange
hi! link clojureFunc FoxYellow
hi! link clojureRepeat FoxYellow
hi! link clojureCharacter FoxAqua
hi! link clojureStringEscape FoxAqua
hi! link clojureException FoxRed
hi! link clojureRegexp FoxAqua
hi! link clojureRegexpEscape FoxAqua
hi! link clojureParen FoxNormal
hi! link clojureAnonArg FoxYellow
hi! link clojureVariable FoxBlue
hi! link clojureMacro FoxOrange
hi! link clojureMeta FoxYellow
hi! link clojureDeref FoxYellow
hi! link clojureQuote FoxYellow
hi! link clojureUnquote FoxYellow

" }}}

" Python: {{{

hi! link pythonBuiltin FoxPurple
hi! link pythonBuiltinFunc FoxOrange
hi! link pythonBuiltinObj FoxOrange
hi! link pythonFunction FoxOrange
hi! link pythonInclude FoxBlue
hi! link pythonImport FoxBlue
hi! link pythonException FoxRed
hi! link pythonExceptions FoxRed
hi! link pythonDecorator FoxRed
hi! link pythonAsync FoxRed
hi! link pythonCoding FoxAqua
hi! link pythonQuotes FoxGreen
hi! link pythonTripleQuote FoxGreen
hi! link pythonRun FoxAqua
hi! link pythonDottedName FoxAqua

" }}}

" Objective-C: {{{

hi! link objcTypeModifier FoxAqua
hi! link objcDirective FoxBlue

" }}}

" Go: {{{

hi! link goImport FoxAqua
hi! link goBuiltin FoxPurple
hi! link goDeclaration FoxAqua
hi! link goDeclType FoxBlue
hi! link goConstants FoxBlue

" }}}

" Rust: {{{

hi! link rustFuncName FoxOrange
hi! link rustFuncCall FoxOrange
hi! link rustOperator FoxNormal
hi! link rustBoolean FoxPurple

" }}}

" Haskell: {{{

hi! link hsVarSym FoxNormal
hi! link hsStructure FoxRed
hi! link hsPragma FoxAqua
hi! link hsCharacter FoxGreen

" }}}

" Lua: {{{

hi! link luaFunc FoxOrange
hi! link luaOperator FoxNormal
hi! link luaTable FoxNormal
hi! link luaIn FoxBlue

" }}}

" C#: {{{

hi! link csModifier FoxOrange
hi! link csClass FoxRed
hi! link csStorage FoxRed
hi! link csUnspecifiedStatement FoxBluE

" }}}

" CoffeeScript: {{{

hi! link coffeeExtendedOp FoxNormal
hi! link coffeeSpecialOp FoxNormal
hi! link coffeeParen FoxNormal
hi! link coffeeBracket FoxNormal

" }}}

" Java: {{{

hi! link javaScopeDecl FoxOrange
hi! link javaParen1 FoxBright

" }}}

" Markdown: {{{

hi! link markdownH1 FoxGreen
hi! link markdownH2 FoxGreen
hi! link markdownH3 FoxYellow
hi! link markdownH4 FoxYellow
hi! link markdownH5 FoxYellow
hi! link markdownH6 FoxYellow
hi! link markdownCode FoxAqua
hi! link markdownCodeBlock FoxAqua
hi! link markdownCodeDelimiter FoxAqua
hi! link markdownBlockquote FoxGray
hi! link markdownListMarker FoxGray
hi! link markdownOrderedListMarker FoxGray
hi! link markdownRule FoxGray
hi! link markdownHeadingRule FoxGray
hi! link markdownUrlDelimiter FoxNormal
hi! link markdownLinkDelimiter FoxNormal
hi! link markdownLinkTextDelimiter FoxNormal
hi! link markdownHeadingDelimiter FoxOrange
hi! link markdownUrl FoxPurple
hi! link markdownUrlTitleDelimiter FoxGreen

" }}}

" HTML: {{{

hi! link htmlTag FoxOrange
hi! link htmlEndTag FoxOrange

" }}}

" CSS: {{{

hi! link cssBraces FoxBlue
hi! link cssFunctionName FoxYellow
hi! link cssIdentifier FoxOrange
hi! link cssClassName FoxGreen
hi! link cssColor FoxBlue
hi! link cssSelectorOp FoxBlue
hi! link cssSelectorOp2 FoxBlue
hi! link cssImportant FoxGreen
hi! link cssVendor FoxNormal
hi! link cssTextProp FoxAqua
hi! link cssAnimationProp FoxAqua
hi! link cssUIProp FoxYellow
hi! link cssTransformProp FoxAqua
hi! link cssTransitionProp FoxAqua
hi! link cssPrintProp FoxAqua
hi! link cssPositioningProp FoxYellow
hi! link cssBoxProp FoxAqua
hi! link cssFontDescriptorProp FoxAqua
hi! link cssFlexibleBoxProp FoxAqua
hi! link cssBorderOutlineProp FoxAqua
hi! link cssBackgroundProp FoxAqua
hi! link cssMarginProp FoxAqua
hi! link cssListProp FoxAqua
hi! link cssTableProp FoxAqua
hi! link cssFontProp FoxAqua
hi! link cssPaddingProp FoxAqua
hi! link cssDimensionProp FoxAqua
hi! link cssRenderProp FoxAqua
hi! link cssColorProp FoxAqua
hi! link cssGeneratedContentProp FoxAqua

" }}}

" JSON: {{

hi! link jsonKeyword FoxGreen
hi! link jsonQuote FoxGreen
hi! link jsonBraces FoxNormal
hi! link jsonString FoxNormal

" }}
