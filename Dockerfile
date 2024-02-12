FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends gfortran \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

RUN gfortran -std=legacy -o main main.f

CMD ["./main"]