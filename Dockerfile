# Dockerfile for Papers We Love website
# Uses Ruby 3.3 for Middleman 4.5.x

FROM ruby:3.3-slim

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

# Install modern bundler
RUN gem install bundler -v 2.5.6

# Copy Gemfile first to leverage Docker cache
# Note: Gemfile.lock may not exist during initial setup
COPY Gemfile Gemfile.loc* ./

# Install gems
RUN bundle install --jobs 4

# Copy the rest of the application
COPY . .

# Expose Middleman server port
EXPOSE 4567

# Default command: run the development server
CMD ["bundle", "exec", "middleman", "server", "--bind-address", "0.0.0.0"]
