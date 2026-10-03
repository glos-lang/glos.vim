" Vim syntax file
" Language: Glos

if exists("b:current_syntax")
    finish
endif

setlocal suffixesadd=.glos
setlocal commentstring=//%s
setlocal formatoptions+=cro/

syntax clear
syntax match glosOperator /[-+*/%<>=!~&|\$\^?]/
syntax match glosConstant "\<[0-9][0-9_]*\(\.[0-9][0-9_]*\)\?\(e[0-9][0-9_]*\)\?\>"
syntax match glosConstant "\<0b[0-1_]\+\>"
syntax match glosConstant "\<0o[0-7_]\+\>"
syntax match glosConstant "\<0[xh][0-9a-fA-F_]\+\>"
syntax match glosDelimiter "[,;:]\|->"

syntax match glosKeyword "#\(if\|assert\|link\|embed\|import\|static\|thread\|private\|library\|reference\|\|location\|caller_location\|main\|platform\)\>"
syntax match glosComment "//.*"
syntax region glosNComment contains=glosNComment start="/\*" end="\*/" fold

syntax match glosHook "@\<[A-z_]\w*\>"
syntax match glosField "\<[A-z_]\w*\>" contained
syntax match glosOperator "\." skipwhite skipnl nextgroup=glosField,glosFunction
syntax match glosOperator "\.\."
syntax match glosOperator "\.\.\."
syntax match glosOperator ":\s*="
syntax match glosFunction "\<[A-z_]\w*\s*("he=e-1

syntax match glosKeyword "\<operator\>" skipwhite skipnl nextgroup=glosOperatorEx
syntax match glosOperatorEx /\[.\{-}\]/ contained

syntax keyword glosType bool rune s8 s16 s32 s64 u8 u16 u32 u64 f32 f64 rawptr error string
syntax keyword glosKeyword map enum trait union struct range inline noreturn distinct if then else for case defer break continue return extern
syntax keyword glosConstant true false null this
syntax keyword glosOperator sizeof typeof

syntax match glosStringEscapeInvalid '\\.' contained
syntax match glosStringEscape /\\e\|\\n\|\\r\|\\t\|\\v\|\\f\|\\0\|\\"\|\\'\|\\\\\|\\{\|\\u\x\{4}\|\\U\x\{8}/ contained
syntax region glosBraces contains=TOP matchgroup=NONE start='{' end='}'
syntax region glosString contains=glosStringEscapeInvalid,glosStringEscape,glosStringInterpolation start='"' skip='\\\\\|\\"' end='"'
syntax region glosString contains=glosStringEscapeInvalid,glosStringEscape start="'" skip="\\\\\|\\'" end="'"
syntax region glosStringInterpolation contained contains=TOP matchgroup=glosStringEscape start='\\{' end='}'

highlight! link glosType Type
highlight! link glosHook Constant
highlight! link glosField Identifier
highlight! link glosString String
highlight! link glosKeyword Keyword
highlight! link glosComment Comment
highlight! link glosNComment Comment
highlight! link glosConstant Number
highlight! link glosFunction Function
highlight! link glosOperator Operator
highlight! link glosOperatorEx Operator
highlight! link glosDelimiter Delimiter
highlight! link glosStringEscape SpecialChar
highlight! link glosStringEscapeInvalid Error

let b:current_syntax = "glos"
