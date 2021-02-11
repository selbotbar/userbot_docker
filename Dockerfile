FROM python:alpine

RUN apk add --no-cache --update \
      git \
      bash \
      redis \
      libpq \
      curl \
      sudo \
      neofetch \
      musl \
      libxml2 \
      libwebp-dev \
      libffi-dev \
      openssl-dev \
      musl-dev \
      gcc \
      rust \
      cargo \
      libxslt-dev \
      libxml2-dev \
      zlib \
      zlib-dev \
      libjpeg \
      libjpeg-turbo-dev \
      linux-headers \
      jq \
      pv

ADD https://raw.githubusercontent.com/RaphielGang/Telegram-Paperplane/staging/requirements.txt requirements.txt
RUN pip install -r requirements.txt

# The sandbox which can be used for the userbot
# Clone your stuff here
# Pip deps are updooted already
RUN mkdir /app && chmod 777 /app

CMD ["python3"]
