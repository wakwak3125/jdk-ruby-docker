FROM circleci/openjdk:11

WORKDIR /home/circleci
ENV PATH /home/circleci/.rbenv/bin:$PATH
ENV PATH /home/circleci/.rbenv/shims/ruby:$PATH
ENV PATH /home/circleci/.rbenv/shims:$PATH

RUN sudo apt update && \
    sudo apt install build-essential libreadline-dev zlib1g-dev libssl1.0-dev && \
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

RUN rbenv install 2.6.5 && \
    rbenv global 2.6.5

RUN gem install bundler
RUN sudo apt install postgresql-client
RUN sudo apt install libpq-dev
