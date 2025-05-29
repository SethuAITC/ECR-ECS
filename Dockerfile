# Use the official Python image as the base image
FROM python:3.9
 
# Set the working directory in the container
WORKDIR /app
 
# Copy the Python dependencies file to the container
COPY requirements.txt .
 
# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
app.py:
# app.py
 
from flask import Flask
 
app = Flask(__name__)
 
# Route to the root URL
@app.route('/')
def hello():
    return 'Hello, Flask on Docker!'
 
# Route to a custom endpoint
@app.route('/greet/<name>')
def greet(name):
    return f'Hello, {name}! Welcome to Flask on Docker.'
 
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
 
# Copy the Flask application code to the container
COPY app.py .
 
# Expose the port the Flask application will run on
EXPOSE 80
 
# Command to run the Flask application when the container starts
CMD ["python", "app.py"]
requirements.txt:
Flask==2.0.3
Werkzeug==2.0.3
