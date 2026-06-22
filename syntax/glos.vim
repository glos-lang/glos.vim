" Vim syntax file
" Language: Glos

if exists("b:current_syntax")
    finish
endif

setlocal suffixesadd=.glos
setlocal commentstring=//%s
setlocal formatoptions+=cro/

syntax clear
syntax match glosConstant "\<[0-9]\+\>"
syntax match glosComment "//.*"
syntax match glosKeyword "#[A-z_]\+\>"
syntax match glosField "\.\s*\a\w*\>"hs=s+1
syntax match glosSpread "\.\.\."
syntax keyword glosType bool char i8 i16 i32 i64 u8 u16 u32 u64 rawptr string any
syntax keyword glosKeyword enum union struct if else for case defer break continue return extern
syntax keyword glosConstant true false null
syntax keyword glosOperator sizeof typeof

syntax match glosStringEscapeInvalid '\\.' contained
syntax match glosStringEscape /\\e\|\\n\|\\r\|\\t\|\\0\|\\"\|\\'\|\\\\\|\\{/ contained
syntax region glosBraces contains=TOP matchgroup=NONE start='{' end='}'
syntax region glosString contains=glosStringEscapeInvalid,glosStringEscape,glosInterpolation start='"' skip='\\\\\|\\"' end='"'
syntax region glosString contains=glosStringEscapeInvalid,glosStringEscape start="'" skip="\\\\\|\\'" end="'"
syntax region glosInterpolation contained contains=TOP matchgroup=glosStringEscape start='\\{' end='}'

highlight! link glosType Type
highlight! link glosField Identifier
highlight! link glosString TSString
highlight! link glosKeyword Keyword
highlight! link glosComment Comment
highlight! link glosConstant Number
highlight! link glosOperator Operator
highlight! link glosStringEscape SpecialChar
highlight! link glosStringEscapeInvalid Error

let b:current_syntax = "glos"
