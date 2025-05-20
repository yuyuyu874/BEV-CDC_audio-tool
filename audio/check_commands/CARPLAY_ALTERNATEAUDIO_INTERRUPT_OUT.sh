/opt/dc-ivi-pf/bin/ahal_debug ahwrite ivol.control.type -n 8
/opt/dc-ivi-pf/bin/ahal_debug ahwrite ivol.control.intersoundtype -n 1
/opt/dc-ivi-pf/bin/ahal_debug ahwrite ivol.control.intersoundtype_vr -n 7
/opt/dc-ivi-pf/bin/ahal_debug ahwrite ivol.setting.vol -n 3221231640
/opt/dc-ivi-pf/bin/ahal_debug ahwrite ivol.setting.isp -n 3
/opt/dc-ivi-pf/bin/ahal_debug ahwrite ivol.setting.isp_vr -n 0
/opt/dc-ivi-pf/bin/ahal_debug ahwrite ivol.setting.msp -n 0
/opt/dc-ivi-pf/bin/ahal_debug ahwrite ivol.control.on -b 1
aplay -D CARPLAY_ALTERNATEAUDIO_INTERRUPT_OUT /home/root/5sec_1kHz_48kHz_16bits_2ch.wav
exit
