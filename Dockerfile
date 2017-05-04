FROM alpine:3.4
MAINTAINER leo.lou@gov.bc.ca

RUN apk update \
  && apk add nodejs \
  && npm install -g http-server

RUN mkdir -p /app
  
WORKDIR /app
ADD . /app

RUN adduser -S app
RUN chown -R app:0 /app && chmod -R 770 /app
RUN apk del --purge alpine-sdk  

USER app
EXPOSE 5000
CMD http-server /app -p 5000 -d false -s -g true --cors -r -e html