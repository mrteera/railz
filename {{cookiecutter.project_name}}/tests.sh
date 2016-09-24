#!/bin/bash

set -x

rubocop -RDS --fail-fast && \
haml-lint app/views/ && \
rails cucumber
COVERALLS=false rails test --fail-fast
