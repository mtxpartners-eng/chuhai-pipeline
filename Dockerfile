FROM python:3.11-slim
WORKDIR /app

COPY webui/requirements.txt /app/webui/requirements.txt
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r webui/requirements.txt -r requirements.txt

COPY webui /app/webui
COPY send_outreach.py schema.py supplier_profile.json /app/

ENV FEEDBACK_DB_PATH=/data/feedback.db
ENV RUNS_ROOT=/data/runs
RUN mkdir -p /data

EXPOSE 8000
CMD ["uvicorn", "webui.app:app", "--host", "0.0.0.0", "--port", "8000"]
