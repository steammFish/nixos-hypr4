
# 定义临时文件存储WiFi列表
wifi_list=$(mktemp)

# 使用nmcli获取可用的WiFi网络，提取BSSID、SSID、信号强度和安全性，去除重复SSID，按信号强度排序
nmcli -f BSSID,SSID,SIGNAL,SECURITY device wifi list | awk 'NR>1 {if (!seen[$2]++) print $2" | Signal: "$3"% | Security: "$4}' | sort -t'|' -k2,2nr > "$wifi_list"

# 使用rofi让用户选择WiFi网络，以更美观的格式显示SSID、信号强度和安全性
selected_wifi=$(cat "$wifi_list" | rofi -dmenu -i -p "Select WiFi:" | cut -d'|' -f1 | xargs)

# 检查用户是否选择了一个WiFi网络
if [ -n "$selected_wifi" ]; then
    # 提示用户输入WiFi密码
    wifi_password=$(rofi -dmenu -p "Enter password for $selected_wifi:" -password)

    # 尝试连接到WiFi网络，使用SSID来连接
    nmcli device wifi connect "$selected_wifi" password "$wifi_password" || {
        echo "Failed to connect to $selected_wifi."
        exit 1
    }
else
    echo "No WiFi selected, exiting..."
    exit 1
fi

# 清理临时文件
rm "$wifi_list"

