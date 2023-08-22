#!/bin/bash

# Check if Bluetooth is powered on
if ! bluetoothctl show | grep -q "Powered: yes"; then
  echo "%{F#66ffffff}"  # Display icon indicating Bluetooth off
else
  # Check if any Bluetooth device is connected
  if bluetoothctl info | grep -q 'Connected: yes'; then
    DEVICE=$(bluetoothctl info | awk -F': ' '/Alias:/ { print $2 }')
    echo "%{F#2193ff} $DEVICE "  # Display connected device name with icon
  else
    echo ""  # Display default icon for powered-on Bluetooth without a connected device
  fi
fi