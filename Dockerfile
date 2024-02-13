FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    gfortran \
    python3 \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

RUN python3 ./scripts/build.py

CMD ["./main"]