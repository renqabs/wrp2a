FROM ghcr.io/ai-auto-register/warp2api:latest

ENV WARP_LOG_LEVEL=info
ENV WARP_ACCESS_LOG=true
ENV OPENAI_LOG_LEVEL=info
ENV OPENAI_ACCESS_LOG=true
ENV HOST=0.0.0.0
        
RUN mkdir /.cache/ && chmod -R 777 /.cache/
RUN chmod -R 777 /app
