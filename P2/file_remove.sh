alias file_remove='function _file_remove() {
    if [ -z "$1" ]; then
        echo "Usage: file_remove <directory>"
        return 1
    fi

    if [ ! -d "$1" ]; then
        echo "Error: Directory \`$1\` does not exist."
        return 1
    fi

    find "$1" -type f -exec rm -f {} \;
    echo "All files in \`$1\` have been removed (directories untouched)."
}; _file_remove'