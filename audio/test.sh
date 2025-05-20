#!/bin/bash

keyword="Signed 16 bit Little Endian, Rate 48000 Hz, Stereo"

current_datetime=$(date +"%Y%m%d_%H%M%S")
result_file="result_${current_datetime}.txt"

check() {
    local DEVICE=$1
    
    echo "========================="
    echo "CHECK $DEVICE"
    echo "========================="
    
    local result=$("$dir_platform_tools/adb.exe" shell < $script_dir/check_commands/$DEVICE.sh)

    if ! echo "$result" | grep -q "$keyword"; then
        echo "[ERROR] $DEVICE の確認に失敗しました"
        return 1
    fi

    echo -n "音声は聞こえましたか(y/n)?: "
    read answer

    if [[ $answer == "y" ]]; then
        echo "[RESULT] $DEVICE の音出しに成功しました"
        echo "$DEVICE -> o" >> $result_file
        return 0
    else
        echo "[RESULT] $DEVICE の音出しに失敗しました"
        echo "$DEVICE -> x" >> $result_file
        return 1
    fi

    echo
}

test_file="5sec_1kHz_48kHz_16bits_2ch.wav"

# ADBでデバイスの接続を確認
if "$dir_platform_tools/adb.exe" devices | grep -q $device_num; then
    echo "[LOGS] デバイスに接続しています。"
else
    echo "[ERROR]デバイスに接続していません"
    exit 1
fi

# 音声がファイルが存在しなければpushする
if ! "$dir_platform_tools/adb.exe" shell test -e /home/root/$test_file; then
    # 音声ファイルをpush
    if "$dir_platform_tools/adb.exe" push $audio_tool_dir/5sec_1kHz_48kHz_16bits_2ch.wav /home/root/; then
        echo "[LOGS] 音声ファイルをpushしました。"
    else
        echo "[ERROR]音声ファイルのpushに失敗しました"
        exit 1
    fi
fi

check "DTV_OUT"
check "USB_OUT"
check "BLUETOOTHAUDIO_OUT"
check "RADIO_OUT(fm)"
check "RADIO_OUT(am)"
check "RADIO_OUT(xm)"
check "CARPLAY_OUT"
check "ANDROIDAUTO_OUT"
check "HDMI_OUT"
check "INTERRUPT_OUT"
check "INTERRUPT_RATE_OUT"
check "CARPLAY_ALTERNATEAUDIO_INTERRUPT_OUT"
check "ANDROIDAUTO_GUIDANCE_INTERRUPT_OUT"

echo "結果を $result_file に保存しました"
