#!/bin/bash

set -x

rubocop -RDS --fail-fast && \
haml-lint app/views/ && \
rails cucumber
COVERAGE=true COVERALLS=false rails test --fail-fast
