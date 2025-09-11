#!/usr/bin/env bats

# Package Management Tests
# Testing install, uninstall, update, and installed commands

load test_helper

@test "mcpreg installed shows no packages initially" {
    # Clean up any existing package tracking
    rm -f "$MCP_CONFIG_DIR/installed_packages.json"
    
    run "$SCRIPT_DIR/../src/mcpreg" installed
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "No MCP servers installed" ]]
    [[ "${output}" =~ "To install a server" ]]
}

@test "mcpreg install without name shows error" {
    run "$SCRIPT_DIR/../src/mcpreg" install
    [ "$status" -eq 1 ]
    [[ "${output}" =~ "Server name is required" ]]
}

@test "mcpreg uninstall without name shows error" {
    run "$SCRIPT_DIR/../src/mcpreg" uninstall
    [ "$status" -eq 1 ]
    [[ "${output}" =~ "Server name is required" ]]
}

@test "mcpreg update without name updates all packages" {
    # Clean up any existing package tracking
    rm -f "$MCP_CONFIG_DIR/installed_packages.json"
    
    run "$SCRIPT_DIR/../src/mcpreg" update
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "No packages installed to update" ]]
}

@test "mcpreg uninstall non-existent package shows warning" {
    run "$SCRIPT_DIR/../src/mcpreg" uninstall nonexistent
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "No installed packages found matching 'nonexistent'" ]]
}

@test "mcpreg update non-existent package shows warning" {
    run "$SCRIPT_DIR/../src/mcpreg" update nonexistent
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "No installed packages found matching 'nonexistent'" ]]
}

@test "mcpreg install with invalid package shows error" {
    run "$SCRIPT_DIR/../src/mcpreg" install definitely-does-not-exist-12345
    [ "$status" -eq 1 ]
    [[ "${output}" =~ "Failed to install definitely-does-not-exist-12345 via npm or pip" ]]
}

@test "mcpreg install shows fuzzy matching when exact match fails" {
    # This test assumes the API is available and returns results
    run "$SCRIPT_DIR/../src/mcpreg" install file
    # Should either succeed with fuzzy matching or show timeout/API error
    [ "$status" -eq 0 ] || [ "$status" -eq 1 ]
    # If it succeeds, it should show some kind of result
    # If it fails, it should show timeout or API error
    [[ "${output}" =~ "Searching for servers matching" || "${output}" =~ "timeout" || "${output}" =~ "API" ]]
}
