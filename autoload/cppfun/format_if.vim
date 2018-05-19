" ==============================================================
" Author: chxuan <787280310@qq.com>
" Repository: https://github.com/chxuan/cppfun
" Create Date: 2018-05-01
" License: MIT
" ==============================================================

" 格式化if参数
function! cppfun#format_if#format_if()
    if <sid>is_ready_format()
        call <sid>recover_format_param()
    else
        call <sid>format_param()
    endif
endfunction

" 检查是否已经格式化
function! s:is_ready_format()
    let text = cppfun#util#get_current_row_text()

    if cppfun#util#is_contains(text, "if") && cppfun#util#is_contains(text, "(") && cppfun#util#is_contains(text, ")")
        return 0
    endif

    return 1
endfunction

" 格式化if参数
function! s:format_param()
    let fun_row_num = cppfun#util#get_current_row_num()
    let text = cppfun#util#get_current_row_text()
    call cppfun#util#delete_current_row()
    call cppfun#util#write_text_at_current_row(<sid>get_format_if_text(text))
    call cppfun#util#set_cursor_position(fun_row_num)
    call cppfun#util#set_code_alignment()
endfunction

" 恢复格式化if参数
function! s:recover_format_param()
    let begin_num = <sid>get_if_begin_num()
    let end_num = <sid>get_if_end_num()
    call cppfun#util#set_cursor_position(begin_num)
    call cppfun#util#merge_row(begin_num, end_num)
endfunction

" 获得格式化后的if文本
function! s:get_format_if_text(text)
    let result = cppfun#util#replace_string(a:text, " &", "\n&")
    let result = cppfun#util#replace_string(result, " |", "\n|")
    return result . "\n"
endfunction

" 获得if开始行号
function! s:get_if_begin_num()
    let current_num = cppfun#util#get_current_row_num()

    while current_num >= 1
        let text = cppfun#util#get_row_text(current_num)
        if cppfun#util#is_contains(text, "if")
            return current_num
        endif
        let current_num -= 1
    endwhile

    return -1
endfunction

" 获得if结束行号
function! s:get_if_end_num()
    let current_num = cppfun#util#get_current_row_num()
    let end_num = current_num + 100

    while current_num < end_num
        let text = cppfun#util#get_row_text(current_num)
        if cppfun#util#is_contains(text, "{")
            return current_num - 1
        endif
        let current_num += 1
    endwhile

    return -1
endfunction
