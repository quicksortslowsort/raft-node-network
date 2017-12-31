FROM ruby:2.4.1-onbuild

ADD ./src /src

RUN chmod +x ./src/raft-node.rb

ENTRYPOINT ruby ./src/raft-node.rb
