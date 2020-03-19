" Vim syntax file
" Language: Google mtail
" Maintainer: Phil Porada - philporada@gmail.com
" https://github.com/google/mtail/blob/master/docs/Language.md

if exists("b:current_syntax")
    finish
endif

" Include hyphens as keyword characters so that a longer name doesn't get
" partially highlighted by accident
setlocal iskeyword+=-

syn case ignore
syn keyword mtailWordsUncontained   next stop hidden const by del after else buckets otherwise
syn keyword mtailWordsContained     def contained
syn keyword mtailTypes              counter gauge histogram

syn region mtailDecorator start="^def.*" end="\( {$\)\@=" contains=mtailWordsContained

syn region mtailDecoratedAction start="^@.*\s" end="\({$\)\@="

syn match mtailGetFilename "getfilename()" contains=@mtailOperators,mtailVar
syn region mtailSetTime start="settime[\s]*(" end=")\(.*$\)\@=" contains=@mtailOperators,mtailVar
syn region mtailStrpTime start="strptime[\s]*(" end=")\(.*$\)\@=" contains=@mtailOperators,mtailVar
syn match mtailTimestamp "timestamp(.*)" contains=@mtailOperators,mtailVar

syn match mtailVar "\$\w\+"

syn match mtailComment /#.*$/ contains=mtailTodo
syn keyword mtailTodo contained TODO FIXME XXX

syn match mtailOpLT "\s<\s"
syn match mtailOpLTE "\s<=\s"
syn match mtailOpGT "\s>\s"
syn match mtailOpGTE "\s>=\s"
syn match mtailOpE "\s==\s"
syn match mtailOpNE "\s\!=\s"
syn match mtailOpPM "\s=\~\s"
syn match mtailOpNotPM "\s\!\~\s"
syn match mtailOpOr "\s||\s"
syn match mtailOpAnd "\s&&\s"
syn match mtailOpAssignment "\s=\s"
syn match mtailOpIncrement "++"
syn match mtailOpIncrementBy "+="
syn match mtailOpDecrement "--"
syn match mtailOpUnaryNegation "\s\!\s"
syn match mtailOpBitwiseOr "|"
syn match mtailOpBitwiseAnd "\s&\s"
syn match mtailOpBitwiseXOR "\s^\s"
syn match mtailOpBitwiseShiftLeft "\s<<\s"
syn match mtailOpBitwiseShiftRight "\s>>\s"
syn match mtailOpAddition "\s+\(=\)\@!"
syn match mtailOpSubtraction "\s-\s"
syn match mtailOpMultiplication "\s\*\s"
syn match mtailOpExponent "\s\*\*\s"

syn cluster mtailOperators contains=mtailOpLT,mtailOpLTE,mtailOpGT,mtailOpGTE,mtailOpE,mtailOpNE,mtailOpPM,mtailOpNotPM,mtailOpOr,mtailOpAnd,mtailOpUnaryNegation,mtailOpBitwiseOr,mtailOpBitwiseAnd,mtailOpBitwiseXOR,mtailOpAddition,mtailOpSubtraction,mtailOpMultiplication,mtailOpExponent,mtailOpBitwiseShiftLeft,mtailOpBitwiseShiftRight,mtailOpAssignment,mtailOpIncrement,mtailOpIncrementBy,mtailOpDecrement


hi def link mtailWordsUncontained       Keyword
hi def link mtailWordsContained         Keyword
hi def link mtailTypes                  Keyword
hi def link mtailDecorator              Structure
hi def link mtailDecoratedAction        Structure
hi def link mtailGetFilename            String
hi def link mtailSetTime                String
hi def link mtailStrpTime               String
hi def link mtailTimestamp              String
hi def link mtailComment                Comment
hi def link mtailTodo                   Todo
hi def link mtailVar                    Type
hi def link mtailOpLT                   Macro
hi def link mtailOpLTE                  Macro
hi def link mtailOpGT                   Macro
hi def link mtailOpGTE                  Macro
hi def link mtailOpE                    Macro
hi def link mtailOpNE                   Macro
hi def link mtailOpPM                   Macro
hi def link mtailOpNotPM                Macro
hi def link mtailOpOr                   Macro
hi def link mtailOpAnd                  Macro
hi def link mtailOpUnaryNegation        Macro
hi def link mtailOpBitwiseOr            Macro
hi def link mtailOpBitwiseAnd           Macro
hi def link mtailOpBitwiseXOR           Macro
hi def link mtailOpBitwiseShiftLeft     Macro
hi def link mtailOpBitwiseShiftRight    Macro
hi def link mtailOpAddition             Macro
hi def link mtailOpSubtraction          Macro
hi def link mtailOpMultiplication       Macro
hi def link mtailOpExponent             Macro
hi def link mtailOpIncrement            Macro
hi def link mtailOpIncrementBy          Macro
hi def link mtailOpAssignment           Macro
hi def link mtailOpDecrement            Macro
