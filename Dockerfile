FROM python:3.9-slim-buster
WORKDIR /app
COPY ./code/ .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
