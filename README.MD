curl --header "Content-Type: application/json" --request POST --data @file.json http://localhost:5000/files/names.json
curl --header "Content-Type: video/mp4" --request POST --data @111.mp4 http://localhost:5000/files/111.mp4
curl -F file=@111.mp4;"type=video/mp4" --request POST   http://localhost:5000/files/111.mp4
