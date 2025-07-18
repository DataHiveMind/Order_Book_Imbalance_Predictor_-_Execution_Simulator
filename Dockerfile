# Dockerfile for orderbook-imbalance-sim

# Use official slim Python image for smaller footprint
FROM python:3.10-slim

# Prevent Python from writing .pyc files and buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      git \
      curl && \
    rm -rf /var/lib/apt/lists/*

# Create non-root user and work directory
RUN useradd --create-home --shell /bin/bash appuser
WORKDIR /home/appuser/app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY src/ ./src/
COPY notebooks/ ./notebooks/
COPY data/ ./data/
COPY tests/ ./tests/


# Change ownership so appuser can run everything
RUN chown -R appuser:appuser /home/appuser/app

# Switch to non-root user
USER appuser

# Expose JupyterLab port (optional)
EXPOSE 8888

# Default entrypoint (run full pipeline)
ENTRYPOINT ["python", "-m", "src.main"]
