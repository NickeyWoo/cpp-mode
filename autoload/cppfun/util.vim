" ==============================================================
" Author: chxuan <787280310@qq.com>
" Repository: https://github.com/chxuan/cppfun
" Create Date: 2018-05-01
" License: MIT
" ==============================================================

" 删除字符串左边空格和制表符
function! cppfun#util#trim_left(str)
    let status = 1
    let result = ""

    for i in range(0, len(a:str) - 1)
        if status == 1 && a:str[i] != " " && a:str[i] != "\t"
            let result = result . a:str[i]
            let status = 2
        elseif status == 2
            let result = result . a:str[i]
        endif
    endfor

    return result
endfunction

" 删除字符串列表
function! cppfun#util#erase_string_list(str, list)
    let result = a:str

    for i in range(0, len(a:list) - 1)
        let result = cppfun#util#replace_string(result, a:list[i], "")
    endfor
    
    return result
endfunction

" 替换字符串
function! cppfun#util#replace_string(str, src, target)
    return substitute(a:str, a:src, a:target, "g")
endfunction

"删除特定字符
function! cppfun#util#erase_char(str, token)
    let result = ""

    for i in range(0, len(a:str) - 1)
        if a:str[i] != a:token
            let result = result . a:str[i]
        endif
    endfor

    return result
endfunction

" 判断字符串(列表)包含
function! cppfun#util#is_contains(main, sub)
    return match(a:main, a:sub) != -1
endfunction

" 设置光标位置
function! cppfun#util#set_cursor_position(line_num)
    let pos = [0, a:line_num, 0, 0]  
    call setpos(".", pos)
endfunction

" 在当前行写入文本
function! cppfun#util#write_text_at_current_row(text)
    execute "normal i" . a:text
endfunction

" 在下一行行写入文本
function! cppfun#util#write_text_at_next_row(text)
    execute "normal o" . a:text
endfunction

" 从当前行开始对齐
function! cppfun#util#code_alignment()
    execute "normal =G"
endfunction

" 获得当前行号
function! cppfun#util#get_current_row_num()
    return line(".")
endfunction

" 获得当前行文本
function! cppfun#util#get_current_row_text()
    return getline(".")
endfunction

" 获得指定行文本
function! cppfun#util#get_row_text(row_num)
    return getline(a:row_num)
endfunction
