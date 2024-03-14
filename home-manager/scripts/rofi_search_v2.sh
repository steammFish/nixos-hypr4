engines=(
    ["Google"]="https://www.google.com/search?q="
    ["Bing"]="https://www.bing.com/search?q="
    ["DuckDuckGo"]="https://duckduckgo.com/?q="
    ["cppreference"]="https://duckduckgo.com/?sites=cppreference.com&q="
    ["mynixos"]="https://mynixos.com/search?q="
    ["googleTranslate"]="https://translate.google.com/?text="
)

# 文件路径定义
history_file="$HOME/.rofi_search_history"
bookmark_file="$HOME/.rofi_bookmarks"

# 确保历史文件和书签文件存在
touch "$history_file"
touch "$bookmark_file"

# 定义搜索引擎列表
declare -A engines

# 构建搜索引擎选择菜单
engine_names=$(printf "%s\n" "${!engines[@]}")

# 读取书签并转换为带前缀的菜单项
bookmarks_menu=$(awk -F',' '{printf "[Bookmark] %s\n", $1}' "$bookmark_file")

# 读取历史记录并添加前缀
history_menu=$(awk '{printf "[History] %s\n", $0}' "$history_file")

# 构建菜单项：包括书签和历史记录
menu_items="Type to search...\n$bookmarks_menu\n$history_menu"

# 显示rofi菜单
selected_item=$(echo -e "$menu_items" | rofi -dmenu -p "Enter query or select:")

# 解析用户选择
if [[ "$selected_item" == "[Bookmark]*" ]]; then
    # 是书签，提取书签名
    bookmark_name=$(echo "$selected_item" | sed 's/^\[Bookmark\] //')
    bookmark_url=$(awk -F',' -v name="$bookmark_name" '$1==name {print $2}' "$bookmark_file")
    xdg-open "$bookmark_url"
elif [[ "$selected_item" == "[History]*" ]]; then
    # 是历史记录
    entry=$(echo "$selected_item" | sed 's/^\[History\] //')
    engine=$(echo "$entry" | grep -oP '\[\K[^\]]+')
    query=$(echo "$entry" | grep -oP '\]\K.*')
    xdg-open "${engines[$engine]}${query}"
else
    # 非书签，进行搜索
    engine=$(echo -e "$engine_names" | rofi -dmenu -p "Choose search engine:")
    if [ -n "$engine" ]; then
        query="$selected_item"
        # 保存到历史文件，格式为 [Engine] Search Query
        echo "[$engine] $query" >> "$history_file"
        # 搜索
        xdg-open "${engines[$engine]}${query}"
    fi
fi

