#!/bin/sh

TARGET="$HOME/.local/share/systemd/user"
SFILE="datasheet-sync.service"
TFILE="datasheet-sync.timer"

mkdir -p "$TARGET"

cat > "$TARGET/$SFILE" <<EOF
[Unit]
Description=Online PDF Change Tracker Service
RefuseManualStart=no
 
[Service]
Type=oneshot
EOF

echo "ExecStart=$PWD/datasheet-sync.sh" >> "$TARGET/$SFILE"


cat > "$TARGET/$TFILE" <<EOF
[Unit]
Description=Track Changes in PDF Files From the Web [Timer]

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
EOF

systemctl --user daemon-reload
systemctl --user enable "$TFILE"
systemctl --user list-timers --all
