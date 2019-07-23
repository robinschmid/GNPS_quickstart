FROM ubuntu:18.04
FROM mono:latest

MAINTAINER Mingxun Wang "mwang87@gmail.com"

RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential

RUN pip3 install ftputil
RUN pip3 install flask
RUN pip3 install gunicorn
RUN pip3 install requests


################## METADATA ######################
LABEL base_image="mono:latest"
LABEL version="1"
LABEL software="ThermoRawFileParser"
LABEL software.version="1.0.0"
LABEL about.summary="A software to convert Thermo RAW files to mgf and mzML"
LABEL about.home="https://github.com/compomics/ThermoRawFileParser"
LABEL about.documentation="https://github.com/compomics/ThermoRawFileParser"
LABEL about.license_file="https://github.com/compomics/ThermoRawFileParser"
LABEL about.license="SPDX:Unknown"
LABEL about.tags="Proteomics"

################## INSTALLATION ######################
RUN apt-get install -y git

WORKDIR /src
RUN git clone -b master --single-branch https://github.com/compomics/ThermoRawFileParser /src
RUN msbuild

COPY . /app
WORKDIR /app
