#!/bin/bash

trap "exit" INT TERM ERR
trap "kill 0" EXIT

ffserver -hide_banner -loglevel ${FFSERVER_LOG_LEVEL} &
ffmpeg -hide_banner -loglevel ${FFMPEG_LOG_LEVEL} -rtsp_transport tcp ${FFMPEG_INPUT_OPTS} -i ${RTSP_URL1} -i ${RTSP_URL2} -i ${RTSP_URL3} -i ${RTSP_URL4} -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] concat=n=4:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" ${FFMPEG_OUTPUT_OPTS} http://127.0.0.1:8090/feed.ffm
