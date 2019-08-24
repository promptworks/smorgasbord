FROM alpine:3.10

RUN apk --no-cache add -X http://dl-cdn.alpinelinux.org/alpine/edge/community \
      bash git openssh-client gcc g++ libc-dev make \
      zlib-dev tzdata postgresql-dev linux-headers \
      ruby-dev ruby-full ruby-bundler \
      nodejs yarn \
      python3-dev py-pip \
      elixir erlang-runtime-tools inotify-tools \
    && gem install rails -v 6 \
    && pip install pipenv \
    && mix local.hex --force \
    && mix local.rebar --force \
    && mix archive.install hex phx_new --force

