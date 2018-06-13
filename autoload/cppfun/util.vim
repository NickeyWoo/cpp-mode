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
function! cppfun#util#set_cursor_position(row_num, col_num)
    let pos = [0, a:row_num, a:col_num, 0]  
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
function! cppfun#util#set_code_alignment(size)
    execute "normal =" . a:size . "="
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

" 删除当前行
function! cppfun#util#delete_current_row()
    execute "normal dd"
endfunction

" 将下一行追加到当前行尾
function! cppfun#util#append_to_current_row()
    execute "normal J"
endfunction

" 合并开始、结束行之间的文本
function! cppfun#util#merge_row(begin_num, end_num)
    for i in range(a:begin_num, a:end_num - 1)
        call cppfun#util#append_to_current_row()
    endfor
endfunction

" 获得开始、结束行之间的文本
function! cppfun#util#get_text(begin_num, end_num)
    let text = ""

    for i in range(a:begin_num, a:end_num)
        let text = text . cppfun#util#get_row_text(i)
    endfor

    return text
endfunction

" 分割字符串
function! cppfun#util#split_string(str, separator)
    return split(a:str, a:separator)
endfunction

" 查找字符串
function! cppfun#util#find(str, target)
    return stridx(a:str, a:target)
endfunction

" 反向查找字符串
function! cppfun#util#find_r(str, target)
    return strridx(a:str, a:target)
endfunction

" 获得子字符串
function! cppfun#util#substr(str, start, count)
    return strpart(a:str, a:start, a:count)
endfunction

" 判断文件是否存在
function! cppfun#util#is_file_exists(file_path)
    return filereadable(a:file_path)
endfunction

" 获取当前文件路径
function! cppfun#util#get_current_file_path()
    return expand("%:p")
endfunction

" 获取当前文件的base name
function! cppfun#util#get_current_file_base_name()
    let file_path = cppfun#util#get_current_file_path()
    return fnamemodify(file_path, ":t:r")
endfunction

" 获取当前文件后缀名
function! cppfun#util#get_current_file_suffix()
    return expand("%:e")
endfunction

" 获取光标下的单词
function! cppfun#util#get_current_cursor_word()
    return expand("<cword>")
endfunction

" 读取文件
function! cppfun#util#read_file(file_path)
    return readfile(a:file_path)
endfunction

" 打开标签
function! cppfun#util#open_tab(file_path)
    execute ":edit " . a:file_path
endfunction

