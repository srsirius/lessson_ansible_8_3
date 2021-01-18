FROM centos:7

RUN groupadd --gid 2000 sirius \
  && useradd --uid 2000 --gid sirius --shell /bin/bash --create-home sirius
