FROM python:3.13-slim

WORKDIR /app

ENV WARP_LOG_LEVEL=info
ENV WARP_ACCESS_LOG=true
ENV OPENAI_LOG_LEVEL=info
ENV OPENAI_ACCESS_LOG=true
ENV HOST=0.0.0.0

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/ai-auto-register/Warp2Api.git .
        
RUN mkdir /.cache/ && chmod -R 777 /.cache/
RUN chmod -R 777 /app

RUN pip install   fastapi[standard] \
    uvicorn[standard] \
    httpx[http2] \
    protobuf \
    grpcio-tools \
    python-dotenv \
    websockets>=15.0.1 \
    requests>=2.32.5 \
    openai>=1.106.0

CMD ["python", "start.py"]
