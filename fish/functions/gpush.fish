function gpush
    git add .
    if git diff --cached --quiet
        echo "Nothing to commit"
    else
        set msg "auto: "(date "+%Y-%m-%d %H:%M:%S")
        git commit -m $msg
        git push
    end
end
