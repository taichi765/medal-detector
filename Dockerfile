FROM ubuntu:24.04
LABEL Name=medaldetector Version=0.0.1

RUN apt update
RUN apt install -y avr-libc gcc-avr pkg-config avrdude libudev-dev build-essential curl

ENV RUSTUP_HOME=/opt/rustup \
    CARGO_HOME=/opt/cargo \
    PATH=/opt/cargo/bin:$PATH

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal \
    --default-toolchain nightly-2025-04-27 \
    --target avr-none
RUN cargo install ravedude
