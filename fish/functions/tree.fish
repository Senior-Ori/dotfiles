function tree
    set dir (string trim -- $argv[1])
    set depth (string trim -- $argv[2])
    
    if test -z "$dir"
        set dir .
    end
    
    if test -z "$depth"
        set depth 3
    end
    
    set uname (uname)
    
    if test "$uname" = "Darwin"
        set find_cmd "find -E '$dir' -maxdepth $depth -not -regex '.*\/((.idea|.git|.venv|node_modules|venv)\/.*|.DS_Store)'"
    else
        set find_cmd "find '$dir' -maxdepth $depth -regextype posix-extended -not -regex '.*\/((.idea|.git|.venv|node_modules|venv)/.*|.DS_Store)'"
    end
    
    eval $find_cmd | sort | sed \
                -e "s|[^-][^/]*/| ├ |g" \
                -e "s|├ /|├ |g" \
                -e "s|├  ├|│  ├|g" \
                -e "s|├  ├|│  ├|g" \
                -e "s|├  │|│  │|g" \
                -e '$s/├/└/'
end
