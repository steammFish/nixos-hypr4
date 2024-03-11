
history_file="$HOME/.rofi_history"
source="$1"

# Default source is "google" if not provided
if [ -z "$source" ]; then
    source="google"
fi

# Create history file if it doesn't exist
if [ ! -f "$history_file" ]; then
    touch "$history_file"
fi

query=$( (echo -n) | rofi -dmenu -p "Search:" -mesg "search on $source" < "$history_file" | sed -E "s/^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} $source //")

if [ -n "$query" ]; then
    echo "$(date +"%Y-%m-%d %T") $source $query" >> "$history_file"

    # Determine search URL based on source
    case "$source" in
        "google")
            search_url="https://www.google.com/search?q=$query"
            ;;
        "cppreference")
            search_url="https://duckduckgo.com/?sites=cppreference.com&q=$query"
            ;;
        "mynixos")
            search_url="https://mynixos.com/search?q=$query"
            ;;
        *)
            echo "Unknown source: $source"
            exit 1
            ;;
    esac

    google-chrome-stable "$search_url"
fi
