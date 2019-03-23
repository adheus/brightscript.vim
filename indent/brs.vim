" Vim indent file
" Language:	BrightScript
" Maintainer:	Sean Barag <sean@barag.org>
" Last Change:	2019 Mar 23

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1


setlocal indentexpr=GetBrightscriptIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e
setlocal indentkeys+==end,=elsif,=end

if exists("*GetBrightscriptIndent")
    finish
endif

function! GetBrightscriptIndent()

    let SKIP_LINES = "^\\s*\\'"
    let pnum = v:lnum

    while pnum > 0
        let pnum = prevnonblank(pnum-1)
        if getline(pnum) !~? SKIP_LINES
            break
        endif
    endwhile

    if pnum == 0
        return 0
    endif

    let line = getline(v:lnum)
    let currindent = indent(v:lnum)
    let prevline = getline(pnum)
    let previndent = indent(pnum)


    " Match `}`, `]`, and `)`
    if line =~ '^\s*[}\])]'
        return currindent - &sw
    elseif line =~ '^\s*\<\(end\|End\|next\|Next\)\>'
        return currindent - &sw
    elseif line =~ '^\s*\<\(else\|Else\)\>'
        return currindent - &sw
    endif

    if prevline =~ '[{\[(:]\s*$'
        echo "Brace"
        return previndent + &sw
    elseif prevline =~ '^\s*\<\(function\|sub\)\>\c'
        echo "Function/Sub"
        return previndent + &sw
    elseif prevline =~ '^\s*\<\%(if\|else\)\>\c'
        if prevline =~ '\<\%(then\)\>\s*$\c'
            " auto-indent what looks like a multiline if statement
            return previndent + &sw
        else
            " but not for single-line if statements
            return previndent
        endif
    elseif prevline =~ '^\s*\<\(for\|while\)\>\c'
        return previndent + &sw
    endif

    return previndent
endfunction
