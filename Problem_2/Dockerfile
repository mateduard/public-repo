# A python image would be the most suitable for our small app
FROM python:3.9-slim

# Set the working directory to /app so we won't have to change it everytime
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY app.py /app

# Let's also define the environment variable 
ENV MY_ENV_VAR="Test"

# Run the Python script when the container launches
CMD ["python", "./app.py"]