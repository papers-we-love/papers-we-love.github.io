# Dockerfile for Papers We Love website
# Uses Ruby 2.7 for compatibility with Middleman 3.4.1 and legacy gems

FROM ruby:2.7-slim

# Install build dependencies for native gems (nokogiri, etc.)
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install bundler at the version specified in Gemfile.lock
RUN gem install bundler -v 1.17.3

# Copy Gemfile first to leverage Docker cache
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install --jobs 4

# Copy the rest of the application
COPY . .

# Expose Middleman server port
EXPOSE 4567

# Default command: run the development server
CMD ["bundle", "exec", "middleman", "server", "--bind-address", "0.0.0.0"]
