#!/usr/bin/env bats

# Authentication Tests

load test_helper

@test "mcpreg auth command exists" {
    run "$SCRIPT_DIR/../src/mcpreg" auth
    # Should either succeed or show error about gh CLI
    [ "$status" -eq 0 ] || [ "$status" -eq 1 ]
    # Should show some kind of authentication-related message
    [[ "${output}" =~ "GitHub" || "${output}" =~ "authentication" || "${output}" =~ "gh" ]]
}

@test "mcpreg shows authentication status in config" {
    run "$SCRIPT_DIR/../src/mcpreg" config
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "GitHub CLI Status" ]]
    [[ "${output}" =~ "GitHub CLI:" ]]
}

@test "mcpreg shows environment variables in config" {
    run "$SCRIPT_DIR/../src/mcpreg" config
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "Environment Variables" ]]
    [[ "${output}" =~ "GITHUB_TOKEN" ]]
    [[ "${output}" =~ "GITHUB_AUTH_TOKEN" ]]
}

@test "mcpreg works without authentication" {
    # Test that commands work even without GitHub authentication
    # (they should show info messages but not fail)
    run "$SCRIPT_DIR/../src/mcpreg" --help
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "MCP Registry CLI" ]]
}

@test "mcpreg commands work without authentication" {
    run "$SCRIPT_DIR/../src/mcpreg" commands
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "Available commands" ]]
}

@test "mcpreg version works without authentication" {
    run "$SCRIPT_DIR/../src/mcpreg" --version
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "mcpreg version" ]]
}
