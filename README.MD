## To Upload a file
curl --location --request POST http://localhost:5000/files  --form 'file=@"222.mp4"'

## To download the processed file
http://localhost:5000/files/procesed

## Run the container locally
docker run --rm -p 5000:5000 einavl/video-editor

## Attach to a running container
docker exec -it 'Image ID' bash