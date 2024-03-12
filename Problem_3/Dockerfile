# The most appropiate image should be a python one.
FROM python:3.9-slim

# Set the working directory in /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
# (Not needed for this simple script)

# Define environment variable
ENV MY_ENV_VAR="World"

# Run the Python script when the container launches
CMD ["python", "./greet.py"]