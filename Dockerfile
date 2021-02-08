
FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app
RUN pip install -r requirements.txt
RUN  apt-get  update -y
RUN  apt-get install ffmpeg -y

RUN mkdir -p /project/api_uploaded_files
COPY app.py /app
COPY concat.sh /app
COPY 111.mp4 /project/api_uploaded_files
COPY 222.mp4 /project/api_uploaded_files
COPY 333.mp4 /project/api_uploaded_files

#ENTRYPOINT [ "python" ]
CMD [ "python", "app.py" ]