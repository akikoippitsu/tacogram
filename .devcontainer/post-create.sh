#!/bin/bash

# Install system dependencies
apt-get update
apt-get install -y build-essential sqlite3 libsqlite3-dev jq

# Install AI coding assistants
# curl -fsSL https://claude.ai/install.sh | bash
npm install -g @openai/codex
npm install -g @google/gemini-cli

# Install Ruby gems and prepare database
bundle install
rails db:create
rails db:migrate
rails runner scripts/create_data.rb
