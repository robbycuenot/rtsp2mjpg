#!/bin/bash

trap "exit" INT TERM ERR
trap "kill 0" EXIT

ffserver -hide_banner -loglevel ${FFSERVER_LOG_LEVEL} &
ffmpeg -hide_banner -loglevel ${FFMPEG_LOG_LEVEL} -rtsp_transport tcp ${FFMPEG_INPUT_OPTS} -i ${RTSP_URL1} -i ${RTSP_URL2} -i ${RTSP_URL3} -i ${RTSP_URL4} -filter_complex "nullsrc=size=1280x720 [base]; [0:v] setpts=PTS-STARTPTS [upperleft]; [1:v] setpts=PTS-STARTPTS [upperright]; [2:v] setpts=PTS-STARTPTS [lowerleft]; [3:v] setpts=PTS-STARTPTS [lowerright]; [base][upperleft] overlay=shortest=1 [tmp1]; [tmp1][upperright] overlay=shortest=1:x=480 [tmp2]; [tmp2][lowerleft] overlay=shortest=1:y=360 [tmp3]; [tmp3][lowerright] overlay=shortest=1:x=480:y=360" ${FFMPEG_OUTPUT_OPTS} http://127.0.0.1:8090/feed.ffm
