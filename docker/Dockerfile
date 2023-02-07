# build from image
FROM ruby:3.1.2-alpine3.16 as rubyonrails

# set rails environmevt
ARG BUILD_ENV=development
ENV RAILS_ENV=$BUILD_ENV
RUN echo Building for *** $BUILD_ENV *** environment

# create and set working directory
ENV APP_ROOT=/src
RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}

# Install dependencies:
# - build-base: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - tzdata: Time zone DB
# - postgresql-dev postgresql-client: Communicate with postgres through the postgres gem
# - imagemagick: for image processing
# - nano: simple editor with syntax highlighting, spell checking, justifying, completion, undo/redo...
RUN apk add --update build-base tzdata postgresql-dev postgresql-client git bash imagemagick nano

# Set default editor
ENV EDITOR=nano

RUN gem install bundler && gem update --system

# Copy gem files
FROM rubyonrails as build_development
ONBUILD COPY Gemfile* ./

# Install gems and run app
FROM build_development
RUN bundle check || bundle install
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
