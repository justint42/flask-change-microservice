FROM python:3.8.8-slim-buster

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . /app/
COPY . app.py requirements.txt /app/

# Install packages from requirements.txt
RUN pip install --no-cache-dir --upgrade pip &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Install curl
RUN apt-get update && apt-get install -y curl

EXPOSE 8080

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
