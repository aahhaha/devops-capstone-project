FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && useradd --uid 1001 --create-home appuser
COPY service ./service
RUN chown -R appuser:0 /app && chmod -R g=u /app
USER 1001
EXPOSE 8080
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "1", "--access-logfile", "-", "service:app"]
