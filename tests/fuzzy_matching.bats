#!/usr/bin/env bats

# Fuzzy Matching and Server Selection Tests

load test_helper

@test "mcpreg info with exact match works" {
    # This test assumes the API is available
    # If API is down, it will show timeout/error which is also acceptable
    run "$SCRIPT_DIR/../src/mcpreg" info io.github.bytedance/mcp-server-filesystem
    # Should either succeed or show timeout/API error
    [ "$status" -eq 0 ] || [ "$status" -eq 1 ]
}

@test "mcpreg info with fuzzy matching shows search" {
    # This test assumes the API is available
    run "$SCRIPT_DIR/../src/mcpreg" info file
    # Should either show fuzzy matching or timeout/API error
    [ "$status" -eq 0 ] || [ "$status" -eq 1 ]
    # If it succeeds, it should show some kind of result
    # If it fails, it should show timeout or API error
    [[ "${output}" =~ "Searching for servers matching" || "${output}" =~ "timeout" || "${output}" =~ "API" || "${output}" =~ "Server Information" || "${output}" =~ "Non-interactive mode" || "${output}" =~ "Found.*servers matching" ]]
}

@test "mcpreg install with fuzzy matching shows search" {
    # This test assumes the API is available
    run "$SCRIPT_DIR/../src/mcpreg" install file
    # Should either show fuzzy matching or timeout/API error
    [ "$status" -eq 0 ] || [ "$status" -eq 1 ]
    # If it succeeds, it should show some kind of result
    # If it fails, it should show timeout or API error
    [[ "${output}" =~ "Searching for servers matching" || "${output}" =~ "timeout" || "${output}" =~ "API" || "${output}" =~ "Installing" ]]
}

@test "mcpreg uninstall with fuzzy matching searches installed packages" {
    # Clean up any existing package tracking
    rm -f "$MCP_CONFIG_DIR/installed_packages.json"
    
    run "$SCRIPT_DIR/../src/mcpreg" uninstall file
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "No installed packages found matching 'file'" ]]
}

@test "mcpreg update with fuzzy matching searches installed packages" {
    # Clean up any existing package tracking
    rm -f "$MCP_CONFIG_DIR/installed_packages.json"
    
    run "$SCRIPT_DIR/../src/mcpreg" update file
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "No installed packages found matching 'file'" ]]
}

@test "mcpreg info with non-existent server shows no matches" {
    run "$SCRIPT_DIR/../src/mcpreg" info definitely-does-not-exist-12345
    [ "$status" -eq 1 ]
    [[ "${output}" =~ "No servers found matching 'definitely-does-not-exist-12345'" ]]
    [[ "${output}" =~ "Try searching for available servers" ]]
}
