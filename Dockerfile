FROM ruby:2.3


RUN useradd -d /home/bot -m -s /bin/bash -u 7777 bot \
    && apt-get update \
    && apt-get install python-pip python-dev -y \ 
    && pip install --upgrade cffi \
    && pip install  --upgrade pyasn1 \
    && pip install PyYAML jinja2 paramiko \
    && pip install ansible \
    && mkdir /home/bot/lita/ \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY lita/* /home/bot/lita/

WORKDIR /home/bot/lita

RUN gem install lita \
    && bundle \
    && chown -R 7777:7777 /home/bot \
    && chown -R 7777:7777 /usr/local/bundle

ENV HOME /home/bot

USER bot

CMD ["/home/bot/lita/lita_start.sh"]
