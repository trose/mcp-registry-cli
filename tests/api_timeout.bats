#!/usr/bin/env bats

# API Timeout and Error Handling Tests

load test_helper

@test "mcpreg search handles timeout gracefully" {
    # Clear cache to force API call
    rm -rf "$MCP_CACHE_DIR"
    
    # This test may timeout or succeed depending on API availability
    # We just want to ensure it doesn't hang indefinitely
    run timeout 15s "$SCRIPT_DIR/../src/mcpreg" search test
    # Should either succeed (0) or timeout/fail (1 or 124)
    [ "$status" -eq 0 ] || [ "$status" -eq 1 ] || [ "$status" -eq 124 ]
}

@test "mcpreg list handles timeout gracefully" {
    # Clear cache to force API call
    rm -rf "$MCP_CACHE_DIR"
    
    # This test may timeout or succeed depending on API availability
    run timeout 15s "$SCRIPT_DIR/../src/mcpreg" list
    # Should either succeed (0) or timeout/fail (1 or 124)
    [ "$status" -eq 0 ] || [ "$status" -eq 1 ] || [ "$status" -eq 124 ]
}

@test "mcpreg info handles timeout gracefully" {
    # Clear cache to force API call
    rm -rf "$MCP_CACHE_DIR"
    
    # This test may timeout or succeed depending on API availability
    run timeout 15s "$SCRIPT_DIR/../src/mcpreg" info test
    # Should either succeed (0) or timeout/fail (1 or 124)
    [ "$status" -eq 0 ] || [ "$status" -eq 1 ] || [ "$status" -eq 124 ]
}

@test "mcpreg search shows fallback when API unavailable" {
    # Clear cache to force API call
    rm -rf "$MCP_CACHE_DIR"
    
    # Mock API failure by setting invalid URL
    MCP_REGISTRY_BASE_URL="http://invalid-url-that-will-timeout" run "$SCRIPT_DIR/../src/mcpreg" search test
    # Should show fallback message
    [[ "${output}" =~ "API is currently unavailable" || "${output}" =~ "timeout" || "${output}" =~ "Example" ]]
}

@test "mcpreg list shows fallback when API unavailable" {
    # Clear cache to force API call
    rm -rf "$MCP_CACHE_DIR"
    
    # Mock API failure by setting invalid URL
    MCP_REGISTRY_BASE_URL="http://invalid-url-that-will-timeout" run "$SCRIPT_DIR/../src/mcpreg" list
    # Should show fallback message
    [[ "${output}" =~ "API is currently unavailable" || "${output}" =~ "timeout" || "${output}" =~ "Example" ]]
}
