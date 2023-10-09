FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs cmake curl
RUN curl -fsSL "https://github.com/cli/cli/releases/download/v2.35.0/gh_2.35.0_linux_amd64.tar.gz" | tar -xz -C /usr/local
RUN ln -s /usr/local/gh_2.35.0_linux_amd64/bin/gh /usr/local/bin/gh
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]