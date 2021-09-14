if exists("b:current_syntax")
    finish
endif

syn keyword alloyKeyword abstract and as assert sig extends
syn keyword alloyKeyword but check else exactly enum
syn keyword alloyKeyword fact for fun module example test expect inst
syn keyword alloyKeyword iff implies Int let in
syn keyword alloyKeyword open or pred run sum
syn keyword alloyKeyword sat unsat is theorem
syn keyword alloyKeyword option
syn keyword alloyKeyword max sing add
syn keyword alloyKeyword after always eventually
syn keyword alloyKeyword before historically once until

syn keyword alloyConstant univ iden none
syn keyword alloyOperator one lone all some no disj not set

syn region alloyComment start="/\*" end="\*/"
syn region alloyComment start="\-\-" end="\n"
syn region alloyComment start="//" end="\n"

hi def link alloyKeyword    Statement
hi def link alloyComment    Comment
hi def link alloyConstant   Constant
hi def link alloyOperator   Operator

let b:current_syntax = "alloy"
