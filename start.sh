#!/bin/bash

cd /quicclient
export PATH=$PATH:/quicclient
tcpdump -i op0 -G 200 'port 8081' -w /monroe/results/quic.pcap &
tcpdump -i op0 -G 200 'port 9091' -w /monroe/results/tcp.pcap &
./flowsim client -N 10M -I 193.147.104.35 -t 5 -Q > /monroe/results/quic10m.csv & ./flowsim client -N 10M -I 193.147.104.35 -t 5 -p 9091 > /monroe/results/tcp10m.csv
#./webrtc-streamer -H 8888 rtsp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov rtsp://217.17.220.110/axis-media/media.amp &
sleep 20
