FROM alpine:3.18.3

RUN apk update
RUN apk add ruby ruby-dev make gcc g++ libc-dev

# Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
RUN apk add --update npm

RUN mkdir -p /opt/middleman

WORKDIR /opt/middleman

COPY . .

RUN gem install bundler
RUN bundle install

RUN middleman build