#!/bin/bash

set -x

rubocop -RDS --fail-fast && \
haml-lint app/views/ && \
rails cucumber
rails test --fail-fast
