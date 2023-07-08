print_date() {
	date "+%F %H:%M"
}

print_layout() {
	swaymsg -t get_inputs | grep -m1 'xkb_active_layout_name' |  awk -F '"' '{print $4}'
}

print_pa_sink() {
	data="$(pactl list | grep "Sink #$1" -A 20)"
	vol="$(printf "%s" "$data" | grep "Volume" | grep -o '[^ ]\+%' | head -n 1 | tr '\n' ' ' | sed 's/ $//' | tr -d '\n')"
	if printf "%s" "$data" | grep "Mute: " | head -n 1 | grep "yes" >/dev/null; then
		printf "%s" "<span foreground=\"#ffff00\">$vol</span>"
	else
		printf "%s" "$vol"
	fi
}

echo "VOL: $(print_pa_sink) |" \
	"$(print_layout) |" \
	"$(print_date)"
