FROM mcr.microsoft.com/dotnet/sdk:8.0

RUN apt update && apt install -y \
    libatomic1 \
    wget \
    libicu-dev \
    && apt-get clean

RUN apt update && apt install wget gcc libunwind8 icu-devtools curl libssl-dev procps -y

RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb && \
    dpkg -i libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb && \
    rm libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb

RUN wget https://security.debian.org/debian-security/pool/updates/main/i/icu/libicu63_63.1-6+deb10u2_amd64.deb -O libicu63.deb && \
    dpkg -i ./libicu63.deb && \
    apt-get install -f -y

WORKDIR /server-files

COPY server-files .


COPY entrypoint.sh .
RUN chmod +x ./entrypoint.sh

#ENV COREHOST_TRACE=1
#ENV DOTNET_ROOT=./dotnet/runtime

ENTRYPOINT ["sh", "./entrypoint.sh"]