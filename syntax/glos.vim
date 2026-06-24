" Vim syntax file
" Language: Glos

if exists("b:current_syntax")
    finish
endif

setlocal suffixesadd=.glos
setlocal commentstring=//%s
setlocal formatoptions+=cro/

syntax clear
syntax match glosOperator /[-+*/%<>=!~&|]/
syntax match glosConstant "\<[0-9]\+\>"
syntax match glosDelimiter "[,;:]\|->"

syntax match glosComment "//.*"
syntax match glosKeyword "#\(if\|assert\|link\|import\|static\|private\|library\|main\|platform\|caller_location\)\>"

syntax match glosField "\<\a\w*\>" contained
syntax match glosOperator "\." skipwhite nextgroup=glosField,glosFunction
syntax match glosOperator "\.\."
syntax match glosOperator "\.\.\."
syntax match glosOperator ":="
syntax match glosFunction "\<\a\w*\s*("he=e-1

syntax keyword glosType bool char i8 i16 i32 i64 u8 u16 u32 u64 rawptr string any
syntax keyword glosKeyword enum union struct inline distinct operator if else for case defer break continue return extern
syntax keyword glosConstant true false null this
syntax keyword glosOperator sizeof typeof

syntax match glosStringEscapeInvalid '\\.' contained
syntax match glosStringEscape /\\e\|\\n\|\\r\|\\t\|\\0\|\\"\|\\'\|\\\\\|\\{/ contained
syntax region glosBraces contains=TOP matchgroup=NONE start='{' end='}'
syntax region glosString contains=glosStringEscapeInvalid,glosStringEscape,glosInterpolation start='"' skip='\\\\\|\\"' end='"'
syntax region glosString contains=glosStringEscapeInvalid,glosStringEscape start="'" skip="\\\\\|\\'" end="'"
syntax region glosInterpolation contained contains=TOP matchgroup=glosStringEscape start='\\{' end='}'

highlight! link glosType Type
highlight! link glosField Identifier
highlight! link glosString String
highlight! link glosKeyword Keyword
highlight! link glosComment Comment
highlight! link glosConstant Number
highlight! link glosOperator Operator
highlight! link glosFunction Function
highlight! link glosDelimiter Delimiter
highlight! link glosStringEscape SpecialChar
highlight! link glosStringEscapeInvalid Error

let b:current_syntax = "glos"
