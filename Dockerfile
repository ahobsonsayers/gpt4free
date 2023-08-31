# https://hub.docker.com/_/python
FROM python:3.9-slim

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Install dependencies (and then remove leftover files)
RUN apt update && \
    apt install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . ./gpt4free

# Install gpt4free (and then remove leftover files)
RUN pip install ./gpt4free[api] && \
    rm -rf ./gpt4free

# Expose port
EXPOSE 1337

# Set entrypoint
ENTRYPOINT [ "g4f" ]
