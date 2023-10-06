# Use a lightweight image
FROM python:3.7-slim-buster

# Add minimal CUDA runtime libraries
COPY --from=nvidia/cuda:12.2.0-base-ubuntu20.04 /usr/local/cuda-12.2 /usr/local/cuda-12.2
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-12.2/lib64

# Set the working directory in the container to /app
WORKDIR /app

# Copy the CityLearn directory contents into the container at /app
COPY . /app

# Install required packages
USER root
RUN apt-get -y update \
    && apt-get install -y git \
    # For building box2d
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install a GPU-compatible version of PyTorch (compatible with your CUDA version)
# RUN pip install torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 -f https://download.pytorch.org/whl/cu111/torch_stable.html

# Install packages required for CityLearn
RUN pip install -r requirements.txt

# Install additional packages for development and experiment tracking
RUN pip install mlflow && \
    pip install stable-baselines3==1.7.0 && \
    pip install plotly && \
    pip install optuna && \
    pip install --no-cache-dir jupyter

# Make port 8888 available outside this container for Jupyter notebooks, and 5000 for MLFlow
EXPOSE 8888 5000

# Run jupyter notebook when the container launches
CMD ["jupyter", "notebook", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--NotebookApp.token=citylearn2022", "--allow-root"]
