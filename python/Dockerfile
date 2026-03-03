# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.14-slim-bookworm

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt

COPY . /app

# Switching to a non-root user
RUN useradd --create-home appuser && chown -R appuser /app
USER appuser

CMD ["python", "app.py"]
