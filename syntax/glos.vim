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
syntax keyword glosType bool i8 i16 i32 i64 u8 u16 u32 u64 rawptr
syntax keyword glosKeyword struct if else for break continue return extern print
syntax keyword glosConstant true false
syntax keyword glosOperator sizeof

highlight! link glosType Type
highlight! link glosKeyword Keyword
highlight! link glosComment Comment
highlight! link glosConstant Number
highlight! link glosOperator Operator

let b:current_syntax = "glos"
