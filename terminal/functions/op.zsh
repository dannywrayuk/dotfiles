function op () {
    DIR=$(fd --type d --min-depth 1 --max-depth 4  | fzf)

    if [[ ! -z $DIR ]]; then
        if [[ -d $DIR ]]; then
            cd "$DIR"
        else
            echo "Not found: $DIR"
        fi
    fi
}
