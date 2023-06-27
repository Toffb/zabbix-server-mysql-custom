#build with "docker build -t <tag>:<version> ."
ARG UPSTREAM_TAG=6.4-ubuntu-latest
FROM zabbix/zabbix-server-mysql:${UPSTREAM_TAG}

USER root

RUN set -eux && \
    INSTALL_PKGS="bash \
            snmp \
            net-tools \
            dnsutils \
            libwww-perl \
            libjson-xs-perl \
            libconfig-general-perl \
            rsyslog \
            nano \
            expect" && \
    apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y \
            --no-install-recommends install \
        ${INSTALL_PKGS} && \
        rm /var/lib/mibs/ietf/SNMPv2-PDU

USER 1997
