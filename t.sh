#!/bin/bash

media_prefix="$1"
output_file="$2"

echo "first params $1"
echo "second params $2"

tmp_video=./tmp/mjr-$RANDOM.webm
tmp_audio=./tmp/mjr-$RANDOM.opus

echo "start convert ...."

januspprec_dir=/usr/local/bin/

$januspprec_dir/janus-pp-rec ./$media_prefix-video.mjr $tmp_video

$januspprec_dir/janus-pp-rec ./$media_prefix-audio.mjr $tmp_audio

echo "start meger media...."

ffmpeg -i $tmp_audio -i $tmp_video  -c:v copy -c:a opus -strict experimental $output_file

echo "convert done!"
rm -rf tmp_video
rm -rf tmp_audio
