# flask_web/app.py
from flask import Flask, request, abort, jsonify, send_from_directory, render_template, redirect, url_for
import json
import sys
import os
import imghdr

UPLOAD_DIRECTORY = "/project/api_uploaded_files"

if not os.path.exists(UPLOAD_DIRECTORY):
    os.makedirs(UPLOAD_DIRECTORY)

OUTPUT_DIRECTORY = "/project/api_output_files"

if not os.path.exists(OUTPUT_DIRECTORY):
    os.makedirs(OUTPUT_DIRECTORY)


app = Flask(__name__)


@app.route('/')
def hello_whale():
    return "Whale, Hello there!"

@app.route("/files")
def list_files():
    """Endpoint to list files on the server."""
    files = []
    for filename in os.listdir(UPLOAD_DIRECTORY):
        path = os.path.join(UPLOAD_DIRECTORY, filename)
        if os.path.isfile(path):
            files.append(filename)
    return jsonify(files)



@app.route("/files/procesed")
def get_file():
    bashcommand = "./concat.sh"
    import subprocess
    process = subprocess.Popen(bashcommand.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()
    # ext = os.environ['MEDIA_FILE_TYPE']
    return send_from_directory(OUTPUT_DIRECTORY, "output.mp3", as_attachment=True)


@app.route('/files', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        file = request.files['file']
        filename = file.filename
        file.save(os.path.join(UPLOAD_DIRECTORY, filename))
    return '''
    <!doctype html>
    <title>Upload new File</title>
    <h1>Upload new File</h1>
    <form method=post enctype=multipart/form-data>
      <input type=file name=file>
      <input type=submit value=Upload>
    </form>
    '''

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')