fu! Edit_php_class(str)
    let file_path='/phplib/'.substitute(a:str, '_', '/', 'g').'.php'
    call Edit_edit(file_path)
endfunction

fu! Edit_edit(file_path)
    let cwd=getcwd()
    let full_path=cwd.a:file_path
    exec ':e '.full_path
endfunction

fu! Edit_call(funcname)
    let word = expand("<cword>")
    exec "call ".a:funcname."(word)"
endfunction

fu! CopyCurrentFile()
    exec ":!echo % | trim | pbcopy"
endfunction

" Define some commands
command! Ep :call Edit_call('Edit_php_class')
command! Cp :call CopyCurrentFile()
