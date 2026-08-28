" Vim syntax file
" Language: Glos

if exists("b:current_syntax")
    finish
endif

setlocal suffixesadd=.glos
setlocal commentstring=//%s
setlocal formatoptions+=cro/

syntax clear
syntax match glosOperator /[-+*/%<>=!~&|\$]/
syntax match glosConstant "\<[0-9][0-9_]*\(\.[0-9][0-9_]*\)\?\>"
syntax match glosConstant "\<0x[0-9a-fA-F_]\+\>"
syntax match glosDelimiter "[,;:]\|->"

syntax match glosComment "//.*"
syntax match glosKeyword "#\(if\|assert\|link\|import\|static\|private\|library\|main\|platform\|caller_location\)\>"

syntax match glosField "\<\a\w*\>" contained
syntax match glosOperator "\." skipwhite nextgroup=glosField,glosFunction
syntax match glosOperator "\.\."
syntax match glosOperator "\.\.\."
syntax match glosOperator ":\s*="
syntax match glosFunction "\<\a\w*\s*("he=e-1

syntax keyword glosType bool char s8 s16 s32 s64 u8 u16 u32 u64 f32 f64 rawptr string
syntax keyword glosKeyword enum trait union struct inline distinct operator if else for case defer break continue return extern
syntax keyword glosConstant true false null this
syntax keyword glosOperator sizeof typeof

syntax match glosStringEscapeInvalid '\\.' contained
syntax match glosStringEscape /\\e\|\\n\|\\r\|\\t\|\\0\|\\"\|\\'\|\\\\\|\\{/ contained
syntax region glosBraces contains=TOP matchgroup=NONE start='{' end='}'
syntax region glosString contains=glosStringEscapeInvalid,glosStringEscape,glosStringInterpolation start='"' skip='\\\\\|\\"' end='"'
syntax region glosString contains=glosStringEscapeInvalid,glosStringEscape start="'" skip="\\\\\|\\'" end="'"
syntax region glosStringInterpolation contained contains=TOP matchgroup=glosStringEscape start='\\{' end='}'

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
