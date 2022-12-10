#!/bin/bash

trap "exit" INT TERM ERR
trap "kill 0" EXIT

ffserver -hide_banner -loglevel ${FFSERVER_LOG_LEVEL} &
ffmpeg -hide_banner -loglevel ${FFMPEG_LOG_LEVEL} -rtsp_transport tcp ${FFMPEG_INPUT_OPTS} \
  -i ${RTSP_URL1} -i ${RTSP_URL2} -i ${RTSP_URL3} -i ${RTSP_URL4} -r 25 \
  -filter_complex "[0:v][1:v]hstack[top]; [2:v][3:v]hstack[bottom]; [top][bottom]vstack" \
  ${FFMPEG_OUTPUT_OPTS} -c:v mjpeg -f ffm http://127.0.0.1:8090/feed.ffm
