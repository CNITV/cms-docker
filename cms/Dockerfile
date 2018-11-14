FROM ubuntu:bionic

MAINTAINER "Ciprian Ionescu" <me@ciprian-ionescu.com>

ENV CMS_VERSION=v1.4.rc1
ENV TIMEZONE=UTC
ENV LC_ALL=C.UTF-8

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		tzdata build-essential openjdk-8-jdk-headless fp-compiler \
		python3.6 cppreference-doc-en-html cgroup-lite libcap-dev zip git \
		python3-setuptools python3-tornado python3-psycopg2 \
		python3-sqlalchemy python3-psutil python3-netifaces python3-crypto \
		python3-six python3-bs4 python3-coverage python3-mock python3-requests \
		python3-werkzeug python3-gevent python3-bcrypt python3-chardet patool \
		python3-babel python3-xdg python3-future python3-jinja2 \
		python3-yaml python3-sphinx python3-cups python3-pypdf2 \
	&& ln -fs /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
	&& dpkg-reconfigure --frontend noninteractive tzdata \
	&& rm -rf /var/lib/apt/lists/* \
	&& git clone https://github.com/mcandre/posix-sudo-shim \
	&& cp posix-sudo-shim/lib/sudo /bin \
	&& git clone --recursive -b ${CMS_VERSION} --depth 1 https://github.com/cms-dev/cms

WORKDIR cms

RUN python3 prerequisites.py -y --as-root install \
	&& python3 setup.py install

WORKDIR /

COPY scripts ./scripts
COPY init.sh .

CMD /init.sh