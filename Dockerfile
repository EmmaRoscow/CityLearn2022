# Use a lightweight image
FROM python:3.7-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Copy the CityLearn directory contents into the container at /app
COPY . /app

# Install required packages
USER root
RUN apt-get -y update \
    && apt-get -y install \
    && apt-get install -y git \
    # For building box2d
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install packages required for CityLearn
RUN pip install -r requirements.txt

# Install additional packages for development and experiment tracking
RUN pip install mlflow && \
    pip install stable-baselines3==1.7.0 && \
    pip install --no-cache-dir jupyter

# Make port 8888 available outside this container for Jupyter notebooks, and 5000 for MLFlow
EXPOSE 8888 5000

# Run jupyter notebook when the container launches
CMD ["jupyter", "notebook", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--NotebookApp.token=citylearn2022", "--allow-root"]
