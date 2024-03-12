query=$( (echo -n) | rofi -dmenu -p "Search:" -mesg "Google 翻译")
  # -filter "bilibili")
# query=$( (echo -n) | rofi -dmenu -p "Search:" -mesg "Google 翻译" | tr -s ' ')
if [ -n "$query" ]; then
    hyprctl dispatch workspace 2
    google-chrome-stable "https://translate.google.com/?text=$query"
    # google-chrome --new-window 
fi
