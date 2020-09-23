FROM alpine:3.11

COPY cpanfile /

RUN apk update && \
    apk add \
    curl \
    g++ \
    make \
    mariadb-client \
    perl \
    perl-apache-logformat-compiler \
    perl-bit-vector \
    perl-carp-clan \
    perl-data-ical \
    perl-date-calc \
    perl-datetime \
    perl-db \
    perl-dbd-mysql \
    perl-dev \
    perl-io-socket-ssl \
    perl-json \
    perl-json-webtoken \
    perl-mojolicious \
    perl-moose \
    perl-mime-lite \
    perl-mime-tools \
    perl-namespace-autoclean \
    perl-net-ldap \
    perl-plack \
    perl-posix-strftime-compiler \
    perl-switch \
    perl-text-autoformat \
    perl-text-soundex \
    perl-xml-libxml \
    perl-yaml \
    perl-yaml-libyaml \
    wget && \
    curl -L https://cpanmin.us | perl - App::cpanminus && \
    cpanm DBIx::Class::InflateColumn::Currency --notest && \
    cpanm Date::ICal --notest && \
    cpanm --installdeps . -M https://cpan.metacpan.org
