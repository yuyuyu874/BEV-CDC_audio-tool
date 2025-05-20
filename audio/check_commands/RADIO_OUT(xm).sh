su default -c '/opt/arene/test/brysh dbwrite /db/sys_info/logical_unit_info/step3/satradio.dbf -d 0'
/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.control.audiopath.front -s xm
/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.control.select -n 0
/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.mute.on -b 1
/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.disconnect.on -b 1
/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.connect.on -b 1
/opt/dc-ivi-pf/bin/ahal_debug ahwrite amp.unmute.on -b 1
aplay -D RADIO_OUT /home/root/5sec_1kHz_48kHz_16bits_2ch.wav
exit
