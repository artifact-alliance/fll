from flask import *
from subprocess import *
import requests
from werkzeug.utils import secure_filename
import os
import json
import subprocess
from pathlib import Path

def download_file(url, local_filename):

    try:
        with requests.get(url, stream=True) as r:
            r.raise_for_status()

            with open(local_filename, 'wb') as f:
                for chunk in r.iter_content(chunk_size=8192):
                    if chunk: 
                        f.write(chunk)
        print(f"Successfully downloaded '{local_filename}'")
    except requests.exceptions.RequestException as e:
        print(f"Download failed: {e}")

app = Flask(__name__)

@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        try:
            if 'file' not in request.files:
                return 'No file selected'
            
            file = request.files['file']
            if file.filename == '':
                return 'No file selected'
            
            if file:
                upload_dir = os.path.join(os.path.dirname(__file__), 'fll', 'artifacts')
                if not os.path.exists(upload_dir):
                    os.makedirs(upload_dir)

                filename = secure_filename(file.filename)
                file_path = os.path.join(upload_dir, filename)

                file.save(file_path)

                return f'File {filename} uploaded successfully!'
        
        except Exception as e:
            return f'An error occurred: {e}'
    
    return render_template('upload.html')
    
@app.route('/<file>')
def index(file):
	if file not in ['favicon.ico']:
		try:
			root = os.path.dirname(__file__)
			file_path = os.path.join(root, file)
			with open(file_path, 'r', encoding='utf-8') as file:
				return file.read()
		except Exception as e:
			print(f"Error: {e}")
			return send_from_directory('', file, as_attachment=False)
	else:
		if file == 'fll.html':
			root = os.path.dirname(__file__)
			file_path = os.path.join(root, 'fll', 'index.html')
			with open(file_path, 'r', encoding='utf-8') as file:
				return file.read()
		else:
			return send_from_directory('', file, as_attachment=False)

@app.route('/')
def home():
	root = os.path.dirname(__file__)
	file_path = os.path.join(root, 'index.html')
	with open(file_path, 'r', encoding='utf-8') as file:
		return file.read()


if __name__ == '__main__':
	app.run(host='0.0.0.0', port=80, debug=True)