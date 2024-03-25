create_c_and_h_files() {
    local filename=$1

    # Check if filename is provided
    if [[ -z $filename ]]; then
        echo "Usage: create_c_and_h_files <filename>"
        return 1
    fi

    # Check if files already exist
    if [[ -e "${filename}.c" || -e "${filename}.h" ]]; then
        echo "Files already exist: ${filename}.c or ${filename}.h"
        return 1
    fi

    # Convert filename to uppercase
    local uppercase_filename=$(echo "$filename" | tr '[:lower:]' '[:upper:]')

    # Create .c file
    {
        echo "#include \"$filename.h\""
        echo ""
        echo "int main() {"
        echo "    // Your code here"
        echo "    return 0;"
        echo "}"
    } > "${filename}.c"

    # Create .h file
    {
        echo "#ifndef ${uppercase_filename}_H"
        echo "#define ${uppercase_filename}_H"
        echo ""
        echo "// Function prototypes or any declarations here"
        echo ""
        echo "#endif /* ${uppercase_filename}_H */"
    } > "${filename}.h"

    echo "Created ${filename}.c and ${filename}.h"
}

