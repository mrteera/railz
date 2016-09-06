#!/bin/bash

set -x

rubocop -RDS --fail-fast && \
haml-lint app/views/ && \
rails test && \
rails cucumber
