" Vim plugin to download via http

if exists("g:loaded_download")
    finish
endif
let g:loaded_download = 1

fun! download#get(url) "{{{
    if has('win32')
        if executable('powershell')
            return system(printf("powershell -Command \"& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (Invoke-WebRequest -Uri %s).Content}\"", a:url))
        else
            echoerr "can't find powershell"
            return ""
        endif
    else
        if executable('curl')
            return system(printf("curl %s", a:url))
        else
            echoerr "can't find curl"
            return ""
        endif
    endif
endfunction "}}}
