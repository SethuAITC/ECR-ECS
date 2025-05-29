# Dockerfile
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the app code to the container
COPY app.py .

# Install Flask
RUN pip install flask

# Expose the port
EXPOSE 80

# Run the application
CMD ["python", "app.py"]
