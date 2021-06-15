FROM mcr.microsoft.com/playwright

COPY ./app/ /usr/src/app/

WORKDIR /usr/src/app

RUN apt-get update
# Adapt to Japanese
RUN apt-get -y install locales fonts-ipafont fonts-ipaexfont && \
  echo "ja_JP UTF-8" > /etc/locale.gen && locale-gen

# Install packages
RUN npm i

# Run script
CMD bash -c "node script.js"
