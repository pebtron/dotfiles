" Vim Syntax File
" Author: Thijs "Lamex" Leibbrand
" Version: 1.0
" Creation Date: 15-01-05
" Discription: This file will recognize .dec files and will highlight the comments, numbers and the sideboard syntax (SB:)
" License: GPL
" Other Comments: When you modify this file and want to redistibute it you must have my approval

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax case ignore

" comments:

syntax match decComment "//.\{-}$"

" card numbers:

syntax match decNumber  "-\=\<[0-9]*\.\=[0-9_]\>"

" sideboard:

syntax match decSideboard "SB:"

" need/have/want:

syntax match decHave "hv:"
syntax match decNeed "nd:"
syntax match decWant "wt:"

command -nargs=+ HiLink hi def link <args>

HiLink decComment Comment
HiLink decNumber Number
HiLink decSideboard Special
HiLink decHave Statement
HiLink decNeed Function
HiLink decWant Special

let b:current_syntax = "dec"
