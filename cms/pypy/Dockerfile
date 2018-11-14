FROM ubuntu:bionic

MAINTAINER "Ciprian Ionescu" <me@ciprian-ionescu.com>

ENV CMS_VERSION=v1.4.rc1
ENV TIMEZONE=UTC
ENV LC_ALL=C.UTF-8
ENV PATH=/usr/local/bin:$PATH

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		tzdata build-essential openjdk-8-jdk-headless fp-compiler libpq-dev \
		pypy cppreference-doc-en-html cgroup-lite libcap-dev zip git curl \
	&& ln -fs /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
	&& dpkg-reconfigure --frontend noninteractive tzdata \
	&& rm -rf /var/lib/apt/lists/* \
	&& git clone https://github.com/mcandre/posix-sudo-shim \
	&& cp posix-sudo-shim/lib/sudo /bin \
	&& git clone --recursive -b ${CMS_VERSION} --depth 1 https://github.com/cms-dev/cms \
	&& curl https://bootstrap.pypa.io/get-pip.py | pypy

WORKDIR cms

RUN pip install -r requirements.txt \
	&& pypy prerequisites.py -y --as-root install \
	&& pypy setup.py install

WORKDIR /

COPY scripts ./scripts
COPY init.sh .

CMD /init.sh