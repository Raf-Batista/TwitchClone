# https://pspdfkit.com/blog/2018/how-to-run-your-phoenix-application-with-docker/

# Use an official Elixir runtime as a parent image
FROM elixir:latest

RUN apt-get update && \
  apt-get install -y postgresql-client \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get --assume-yes install -y nodejs \ 
  && apt-get --assume-yes install inotify-tools 

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
RUN mix local.hex --force

# Install rebar
RUN mix local.rebar --force

# Install dependencies
RUN mix deps.get 

# Install node dependencies and set up webpack  && node node_modules/webpack/bin/webpack.js --mode development
RUN cd assets && npm install && cd ..

# Compile the project
RUN mix do compile

CMD ["/app/entrypoint.sh"]