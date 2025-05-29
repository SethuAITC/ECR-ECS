# app.py
 
from flask import Flask
 
app = Flask(__name__)
 
# Route to the root URL
@app.route('/')
def hello():
    return 'Hello, Flask from Docker!'
 
# Route to a custom endpoint
@app.route('/greet/<name>')
def greet(name):
    return f'Hello, {name}! Welcome to Flask on Docker.'
 
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
 
# Copy the Flask application code to the container
COPY app.py .
 
# Expose the port the Flask application will run on
EXPOSE 80
 
# Command to run the Flask application when the container starts
CMD ["python", "app.py"]
