" Vim syntax file
" Language: mtail
" Maintainer: Phil Porada - philporada@gmail.com
" https://github.com/jaqx0r/mtail/blob/main/docs/Language.md
"
" Keywords, builtins and operators can be found in the lexer code at
" https://github.com/jaqx0r/mtail/blob/main/internal/runtime/compiler/parser/lexer.go

if exists("b:current_syntax")
    finish
endif

" Identifiers are letters, digits and underscores only, but keywords are
" case sensitive.
syn case match

" Keywords
syn keyword mtailKeyword        as by const hidden buckets limit after del
syn keyword mtailKeyword        begin log_filter
syn keyword mtailConditional    else otherwise
syn keyword mtailStatement      next stop
syn keyword mtailDef            def nextgroup=mtailDecoratorName skipwhite
syn keyword mtailType           counter gauge timer text histogram

" Builtin functions
syn keyword mtailBuiltin        bool defined float getfilename int len settime
syn keyword mtailBuiltin        string strptime strtol subst timestamp tolower

" Decorators: `def name {` and `@name {`
syn match mtailDecoratorName    "\h\w*" contained
syn match mtailDecorator        "@\h\w*"

" Capture group references: $1, $name
syn match mtailVar              "\$\w\+"

" Operators. Longer operators are listed first so they take precedence over their prefixes.
syn match mtailOperator         "++\|--\|+=\|\*\*\|==\|!=\|=\~\|!\~\|<=\|>=\|<<\|>>\|&&\|||\|[-+*/%<>=&|^~]"

" Numeric literals: integers, floats and durations (1h, 30m, 1h30m, 1.5s)
syn match mtailNumber           "\<\d\+\>"
syn match mtailFloat            "\<\d\+\.\d*\%([eE][+-]\=\d\+\)\=\>\="
syn match mtailFloat            "\<\d\+[eE][+-]\=\d\+\>"
syn match mtailFloat            "\%(\w\|\.\)\@1<!\.\d\+\%([eE][+-]\=\d\+\)\=\>"
syn match mtailDuration         "\<\%(\d\+\%(\.\d\+\)\=[smhd]\)\+\>"

" Strings
syn region mtailString          start=+"+ skip=+\\.+ end=+"+ oneline contains=mtailStringEscape
syn match mtailStringEscape     +\\.+ contained

" The `/` char opens a regex pattern where an expression can
" start; otherwise it's a division operator
syn region mtailRegex           matchgroup=mtailRegexDelim
    \ start=+\%(\%(^\|[=!]\~\|[(,{+]\|&&\|||\|\<else\|\<const\s\+\h\w*\)\s*\)\@<=/+
    \ skip=+\\.+ end=+/+ oneline
    \ contains=mtailRegexEscape,mtailRegexGroupName
syn match mtailRegexEscape      +\\.+ contained
syn match mtailRegexGroupName   "\%((?P\=<\)\@<=\h\w*>\@=" contained

" Comments
syn match mtailComment          "#.*$" contains=mtailTodo,@Spell
syn keyword mtailTodo           contained TODO FIXME XXX NOTE

hi def link mtailKeyword        Keyword
hi def link mtailConditional    Conditional
hi def link mtailStatement      Statement
hi def link mtailDef            Keyword
hi def link mtailType           Type
hi def link mtailBuiltin        Function
hi def link mtailDecoratorName  Structure
hi def link mtailDecorator      Structure
hi def link mtailVar            Identifier
hi def link mtailOperator       Operator
hi def link mtailNumber         Number
hi def link mtailFloat          Float
hi def link mtailDuration       Number
hi def link mtailString         String
hi def link mtailStringEscape   SpecialChar
hi def link mtailRegex          String
hi def link mtailRegexDelim     Delimiter
hi def link mtailRegexEscape    SpecialChar
hi def link mtailRegexGroupName Identifier
hi def link mtailComment        Comment
hi def link mtailTodo           Todo

let b:current_syntax = "mtail"
