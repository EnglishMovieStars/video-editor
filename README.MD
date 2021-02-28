## Service description:
This service merge audio files
It gets some individuals records
It returns one single play-record

## To Upload a file
curl --location --request POST http://localhost:5000/files  --form 'file=@"222.mp3"'

## To download the processed file
http://localhost:5000/files/procesed

## Run the container locally
docker run --rm -p 5000:5000 einavl/videomerge

## Attach to a running container
docker exec -it 'Image ID' bash
