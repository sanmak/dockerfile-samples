# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.12-slim-bookworm

EXPOSE 8080

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt

COPY . /app

RUN useradd --create-home appuser && chown -R appuser /app
USER appuser

# Replace 'myproject.wsgi' with your Django project's WSGI module path
# e.g. for a project named 'mysite': "mysite.wsgi"
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "myproject.wsgi"]
