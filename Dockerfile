FROM rust:latest
LABEL Name=medaldetector Version=0.0.1

RUN apt update
RUN cargo --version
RUN rustup --version
RUN rustc --version

RUN rustup toolchain install nightly
RUN apt install -y avr-libc gcc-avr pkg-config avrdude libudev-dev build-essential
RUN cargo +stable install ravedude
