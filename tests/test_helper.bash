#!/usr/bin/env bash

# Test helper functions for bats tests

# Get the directory where this test file is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Common test setup
setup() {
    # Set up test environment
    export MCP_CACHE_DIR="${BATS_TMPDIR}/mcpreg_cache"
    export MCP_CONFIG_DIR="${BATS_TMPDIR}/mcpreg_config"
    
    # Clean up any existing test directories
    rm -rf "$MCP_CACHE_DIR" "$MCP_CONFIG_DIR"
}

# Common test teardown
teardown() {
    # Clean up test directories
    rm -rf "$MCP_CACHE_DIR" "$MCP_CONFIG_DIR"
}
