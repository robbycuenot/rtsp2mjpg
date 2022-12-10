#!/bin/bash

trap "exit" INT TERM ERR
trap "kill 0" EXIT

vlc --video-filter wall --wall-cols 2 --wall-rows 2 ${RTSP_URL1} ${RTSP_URL2} ${RTSP_URL3} ${RTSP_URL4} :sout="#transcode{vcodec=mjpg}:std{access=http{mime=multipart/x-mixed-replace;boundary=--7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=127.0.0.1:8090}"
