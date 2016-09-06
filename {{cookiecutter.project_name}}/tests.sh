#!/bin/bash

set -x

rubocop -RDS --fail-fast && \
haml-lint app/views/ && \
zeus test && \
zeus cucumber
