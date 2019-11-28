# Run on the alpine docker image for reduced size
FROM python:3.7-alpine

# Only install python requirements if they have changed
COPY requirements.txt /
RUN pip install -r /requirements.txt

# Expose the HTTP port for web UI
EXPOSE 80
