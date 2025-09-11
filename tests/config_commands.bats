#!/usr/bin/env bats

# Configuration and Cache Management Tests

load test_helper

@test "mcpreg config shows configuration" {
    run "$SCRIPT_DIR/../src/mcpreg" config
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "MCP Registry CLI Configuration" ]]
    [[ "${output}" =~ "Registry URL" ]]
    [[ "${output}" =~ "Cache Directory" ]]
    [[ "${output}" =~ "Config Directory" ]]
}

@test "mcpreg config show shows configuration" {
    run "$SCRIPT_DIR/../src/mcpreg" config show
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "MCP Registry CLI Configuration" ]]
    [[ "${output}" =~ "Registry URL" ]]
    [[ "${output}" =~ "Cache Directory" ]]
    [[ "${output}" =~ "Config Directory" ]]
}

@test "mcpreg config clear-cache clears cache" {
    # Create some cache files first
    mkdir -p "$MCP_CACHE_DIR"
    echo '{"test": "data"}' > "$MCP_CACHE_DIR/test.json"
    
    run "$SCRIPT_DIR/../src/mcpreg" config clear-cache
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "Cache cleared successfully" ]]
    
    # Verify cache is cleared
    [ ! -f "$MCP_CACHE_DIR/test.json" ]
}

@test "mcpreg config cache-info shows cache information" {
    run "$SCRIPT_DIR/../src/mcpreg" config cache-info
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "Cache Information" ]]
}

@test "mcpreg config with invalid action shows usage" {
    run "$SCRIPT_DIR/../src/mcpreg" config invalid-action
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "Usage:" ]]
    [[ "${output}" =~ "show" ]]
    [[ "${output}" =~ "clear-cache" ]]
    [[ "${output}" =~ "cache-info" ]]
}

@test "mcpreg config creates cache and config directories" {
    # Clean up first
    rm -rf "$MCP_CACHE_DIR" "$MCP_CONFIG_DIR"
    
    run "$SCRIPT_DIR/../src/mcpreg" config
    [ "$status" -eq 0 ]
    
    [ -d "$MCP_CACHE_DIR" ]
    [ -d "$MCP_CONFIG_DIR" ]
}

@test "mcpreg config shows GitHub CLI status" {
    run "$SCRIPT_DIR/../src/mcpreg" config
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "GitHub CLI Status" ]]
    [[ "${output}" =~ "GitHub CLI:" ]]
}

@test "mcpreg config shows environment variables status" {
    run "$SCRIPT_DIR/../src/mcpreg" config
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "Environment Variables" ]]
    [[ "${output}" =~ "GITHUB_TOKEN" ]]
    [[ "${output}" =~ "GITHUB_AUTH_TOKEN" ]]
}
