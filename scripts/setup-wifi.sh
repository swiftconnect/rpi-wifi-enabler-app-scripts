WIFI_SSID=$1
WIFI_PSSWD=$2

wpa_cli -i wlan0 remove_network 0
wpa_cli -i wlan0 add_network

logger SwiftSense Setting up network 0 with interface wlan0 for SSID: $WIFI_SSID
wpa_cli -i wlan0 set_network 0 ssid \"$WIFI_SSID\"
wpa_cli -i wlan0 set_network 0 psk \"$WIFI_PSSWD\"
wpa_cli -i wlan0 enable_network 0
wpa_cli -i wlan0 save_config
