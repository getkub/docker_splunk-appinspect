FROM python:3-slim

VOLUME /src

RUN apt-get update && \
  apt-get install -y libxml2-dev libxslt-dev lib32z1-dev python-lxml libmagic-dev libjpeg-dev

# Download the latest appinspect
RUN pip install splunk-appinspect

WORKDIR /src

# Default is to run ALL apps in the /src mount with precert mode
CMD splunk-appinspect inspect /src/  --mode precert
