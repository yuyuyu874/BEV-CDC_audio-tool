/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.control.audiopath.front -s hdmi
/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.control.select -n 0
/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.mute.on -b 1
/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.disconnect.on -b 1
/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.connect.on -b 1
/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.unmute.on -b 1
aplay -D HDMI_OUT /home/root/5sec_1kHz_48kHz_16bits_2ch.wav
exit
