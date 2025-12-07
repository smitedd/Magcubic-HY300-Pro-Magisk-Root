#!/system/bin/sh
# HY300 Pro HDMI Smart Switch
# - Surveille l'état HDMI via dumpsys tv_input
# - Passe sur HDMI quand un signal est détecté
# - Revient au launcher quand le signal disparaît

# Laisse le système et les services TV démarrer
sleep 30

CURRENT_STATE="UNKNOWN"

while true; do
    # Récupérer l'état HDMI (0 = ON, autre = OFF selon la commande utilisateur)
    STATE_LINE="$(dumpsys tv_input 2>/dev/null | grep 'HdmiInputService/HW1' | grep -o 'state: [0-9]' | head -n 1)"
    STATE_VALUE="$(echo "$STATE_LINE" | awk '{print $2}')"

    if [ "$STATE_VALUE" = "0" ]; then
        # HDMI_ON
        if [ "$CURRENT_STATE" != "ON" ]; then
            # Bascule sur HDMI une seule fois lors du changement OFF -> ON
            input keyevent 178  # KEYCODE_TV_INPUT_HDMI (sur la plupart des builds)
            CURRENT_STATE="ON"
        fi
    else
        # HDMI_OFF
        if [ "$CURRENT_STATE" != "OFF" ]; then
            # Retour au launcher (HOME) une seule fois lors du changement ON -> OFF
            input keyevent 3    # KEYCODE_HOME
            CURRENT_STATE="OFF"
        fi
    fi

    sleep 5
done
