import pandas as pd
import kagglehub
import os

# Define the target directory for raw data
raw_data_dir = os.path.join('data', 'raw')

# Create the directory if it doesn't exist
os.makedirs(raw_data_dir, exist_ok=True)

# Download the dataset to the specified raw data directory
# The 'path' argument in dataset_download specifies the local directory to save the data
path = kagglehub.dataset_download("praanj/limit-orderbook-data", path=raw_data_dir)

print("Path to dataset files:", path)