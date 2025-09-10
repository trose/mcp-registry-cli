#!/usr/bin/env bats

# MCP Registry CLI Tests
# Using bats testing framework

load test_helper

@test "mcpreg --help shows help message" {
    run "$SCRIPT_DIR/../src/mcpreg" --help
    [ "$status" -eq 0 ]
    [ "${lines[1]}" = "MCP Registry CLI - A pleasant-to-use command-line tool for the MCP Registry" ]
    [[ "${output}" =~ "USAGE:" ]]
    [[ "${output}" =~ "COMMANDS:" ]]
}

@test "mcpreg --version shows version" {
    run "$SCRIPT_DIR/../src/mcpreg" --version
    [ "$status" -eq 0 ]
    [ "${lines[1]}" = "mcpreg version 0.1.0" ]
}

@test "mcpreg commands lists available commands" {
    run "$SCRIPT_DIR/../src/mcpreg" commands
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "Available commands:" ]]
    [[ "${output}" =~ "search <query>" ]]
    [[ "${output}" =~ "list" ]]
    [[ "${output}" =~ "install <name>" ]]
}

@test "mcpreg without arguments shows help" {
    run "$SCRIPT_DIR/../src/mcpreg"
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "MCP Registry CLI" ]]
}

@test "mcpreg search without query shows error" {
    run "$SCRIPT_DIR/../src/mcpreg" search
    [ "$status" -eq 1 ]
    [[ "${output}" =~ "Search query is required" ]]
}

@test "mcpreg search with query shows placeholder" {
    run "$SCRIPT_DIR/../src/mcpreg" search filesystem
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "Searching for: filesystem" ]]
    [[ "${output}" =~ "API is currently unavailable" ]]
}

@test "mcpreg install without name shows error" {
    run "$SCRIPT_DIR/../src/mcpreg" install
    [ "$status" -eq 1 ]
    [[ "${output}" =~ "Server name is required" ]]
}

@test "mcpreg info without name shows error" {
    run "$SCRIPT_DIR/../src/mcpreg" info
    [ "$status" -eq 1 ]
    [[ "${output}" =~ "Server name is required" ]]
}

@test "mcpreg uninstall without name shows error" {
    run "$SCRIPT_DIR/../src/mcpreg" uninstall
    [ "$status" -eq 1 ]
    [[ "${output}" =~ "Server name is required" ]]
}

@test "mcpreg unknown command shows error" {
    run "$SCRIPT_DIR/../src/mcpreg" unknown
    [ "$status" -eq 1 ]
    [[ "${output}" =~ "Unknown command: unknown" ]]
}

@test "mcpreg creates cache and config directories" {
    local cache_dir="$MCP_CACHE_DIR"
    local config_dir="$MCP_CONFIG_DIR"
    
    # Clean up any existing directories
    rm -rf "$cache_dir" "$config_dir"
    
    run "$SCRIPT_DIR/../src/mcpreg" --help
    [ "$status" -eq 0 ]
    
    [ -d "$cache_dir" ]
    [ -d "$config_dir" ]
}
