# MCP Registry CLI Usage Guide

This guide provides detailed usage instructions for the `mcpreg` command-line tool.

## Table of Contents

- [Installation](#installation)
- [Authentication](#authentication)
- [Core Commands](#core-commands)
- [Package Management](#package-management)
- [Configuration](#configuration)
- [Examples](#examples)
- [Error Handling](#error-handling)

## Installation

### Homebrew (Recommended)

```bash
brew tap trose/mcpreg
brew install mcpreg
```

### Manual Installation

1. Download the latest release:
```bash
curl -L https://github.com/trose/mcp-registry-cli/releases/latest/download/mcpreg -o mcpreg
chmod +x mcpreg
sudo mv mcpreg /usr/local/bin/
```

2. Install dependencies:
```bash
# macOS
brew install curl jq

# Ubuntu/Debian
sudo apt-get install curl jq

# CentOS/RHEL
sudo yum install curl jq
```

## Authentication

### Automatic Authentication

The CLI automatically detects GitHub tokens from environment variables:

```bash
# Add to your shell profile (~/.bashrc, ~/.zshrc, etc.)
export GITHUB_TOKEN="your_github_token_here"

# Or use the alternative variable name
export GITHUB_AUTH_TOKEN="your_github_token_here"
```

Create a token at: https://github.com/settings/tokens

### Manual Authentication

If no token is found, use the built-in authentication:

```bash
mcpreg auth
```

This will open your browser for GitHub OAuth authentication.

## Core Commands

### Search Servers

Search for MCP servers by name or description:

```bash
# Basic search
mcpreg search filesystem

# Search with fuzzy matching
mcpreg search file
```

**Features:**
- Fuzzy matching for partial names
- Searches both server names and descriptions
- Shows server count and descriptions
- Graceful fallback when API is unavailable

### List Servers

Browse available servers with pagination:

```bash
# List first 20 servers (default)
mcpreg list

# List specific number of servers
mcpreg list 50
```

**Features:**
- Configurable limit (default: 20)
- Shows server names and descriptions
- Cached for faster subsequent requests

### Get Server Information

Get detailed information about a specific server:

```bash
# Exact server name
mcpreg info io.modelcontextprotocol/filesystem

# Fuzzy matching with selection menu
mcpreg info file
```

**Features:**
- Fuzzy matching with user selection when multiple matches found
- Shows server details, packages, and remotes
- Auto-selects single matches for seamless UX

**Output includes:**
- Server name and description
- Version and status
- Available packages (npm, pip, etc.)
- Remote configurations

## Package Management

### Install Servers

Install MCP servers from the registry:

```bash
# Install by exact name
mcpreg install io.modelcontextprotocol/filesystem

# Install with fuzzy matching
mcpreg install file
```

**Features:**
- Supports both npm and pip packages
- Automatic package type detection
- Fuzzy matching with selection menu
- Direct installation fallback for non-registry packages
- Automatic MCP client configuration generation

**Installation Process:**
1. Checks if already installed
2. Searches registry for server information
3. Falls back to fuzzy matching if exact match fails
4. Installs package using appropriate package manager (npm/pip)
5. Tracks installation in local state
6. Generates MCP client configuration

### List Installed Servers

View all installed MCP servers:

```bash
mcpreg installed
```

**Features:**
- Shows all installed packages with details
- Displays package names, versions, and types
- Provides helpful usage instructions
- Shows update commands

### Uninstall Servers

Remove installed MCP servers:

```bash
# Uninstall by exact name
mcpreg uninstall io.modelcontextprotocol/filesystem

# Uninstall with fuzzy matching
mcpreg uninstall file
```

**Features:**
- Fuzzy matching with installed packages
- Removes packages from npm/pip
- Cleans up tracking and MCP configuration
- Graceful handling of missing packages

### Update Servers

Update installed MCP servers:

```bash
# Update all installed packages
mcpreg update

# Update specific package
mcpreg update io.modelcontextprotocol/filesystem

# Update with fuzzy matching
mcpreg update file
```

**Features:**
- Updates all packages or specific ones
- Gets latest versions from registries
- Updates package tracking
- Shows update summary with success/failure counts

## Configuration

### View Configuration

```bash
# Show current configuration
mcpreg config

# Show configuration (explicit)
mcpreg config show
```

**Shows:**
- Registry URL
- Cache and config directories
- Environment variables status
- GitHub CLI authentication status
- Cache file count

### Cache Management

```bash
# Clear all cached data
mcpreg config clear-cache

# Show detailed cache information
mcpreg config cache-info
```

**Cache Features:**
- 5-minute default TTL for API responses
- Automatic cache invalidation
- Manual cache clearing
- Cache statistics and file details

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `GITHUB_TOKEN` | GitHub authentication token | - |
| `GITHUB_AUTH_TOKEN` | Alternative GitHub token | - |
| `MCP_REGISTRY_BASE_URL` | Registry base URL | `https://registry.modelcontextprotocol.io` |
| `MCP_CACHE_DIR` | Cache directory | `~/.cache/mcpreg` |
| `MCP_CONFIG_DIR` | Config directory | `~/.config/mcpreg` |

## Examples

### Complete Workflow

```bash
# 1. Search for servers
mcpreg search filesystem

# 2. Get detailed information
mcpreg info io.github.bytedance/mcp-server-filesystem

# 3. Install the server
mcpreg install io.github.bytedance/mcp-server-filesystem

# 4. Check installed servers
mcpreg installed

# 5. Update the server
mcpreg update io.github.bytedance/mcp-server-filesystem

# 6. Uninstall when done
mcpreg uninstall io.github.bytedance/mcp-server-filesystem
```

### Fuzzy Matching Examples

```bash
# Install with partial name (shows selection menu)
mcpreg install file
# Output: Found 2 servers matching 'file':
#   1) io.github.huoshuiai42/huoshui-file-search
#   2) io.github.bytedance/mcp-server-filesystem
# Select a server to install (1-2) or 'q' to quit: 1

# Update with partial name
mcpreg update lod
# Output: Found single match: lodash
# [Automatically proceeds with update]

# Uninstall with partial name
mcpreg uninstall test
# Shows selection menu if multiple test-related packages installed
```

### Configuration Examples

```bash
# Check current setup
mcpreg config

# Clear cache if having issues
mcpreg config clear-cache

# View cache details
mcpreg config cache-info

# Set custom cache directory
export MCP_CACHE_DIR="/tmp/mcpreg_cache"
mcpreg config
```

## Error Handling

The CLI is designed to be resilient and user-friendly:

### API Unavailable
- Shows helpful messages and example data
- Graceful fallback with cached responses when possible
- Clear timeout messages (5-10 second timeouts)

### Authentication Issues
- Validates GitHub tokens and provides guidance
- Automatic fallback to browser authentication
- Clear error messages for invalid tokens

### Network Issues
- Graceful fallback with clear error messages
- Timeout handling prevents hanging
- Retry suggestions and troubleshooting tips

### Missing Dependencies
- Clear installation instructions for each platform
- Helpful error messages with specific commands
- Dependency checking on startup

### Package Management Errors
- Clear error messages for installation failures
- Graceful handling of missing packages
- Helpful suggestions for troubleshooting

## Utility Commands

### Help and Version

```bash
# Show help message
mcpreg --help
mcpreg -h

# Show version
mcpreg --version
mcpreg -v

# List all commands
mcpreg commands
```

### Authentication

```bash
# Set up GitHub authentication
mcpreg auth
```

This opens your browser for GitHub OAuth authentication if no token is found in environment variables.

## Tips and Best Practices

1. **Use Environment Variables**: Set `GITHUB_TOKEN` for seamless authentication
2. **Leverage Fuzzy Matching**: Use partial names for faster discovery
3. **Check Cache**: Use `mcpreg config cache-info` to see cached data
4. **Clear Cache**: Use `mcpreg config clear-cache` if experiencing issues
5. **Use Web Interface**: Browse at [https://registry.fastmcp.cloud/](https://registry.fastmcp.cloud/) for visual discovery
6. **Check Installed**: Use `mcpreg installed` to see what you have installed
7. **Update Regularly**: Use `mcpreg update` to keep packages current

## Troubleshooting

### Common Issues

**Command hangs indefinitely:**
- The CLI now has 5-10 second timeouts to prevent this
- Clear cache: `mcpreg config clear-cache`
- Check network connectivity

**Authentication errors:**
- Verify GitHub token: `mcpreg config`
- Try manual auth: `mcpreg auth`
- Check token permissions at GitHub

**Package installation fails:**
- Ensure npm/pip is installed
- Check package name spelling
- Try fuzzy matching: `mcpreg install partial-name`

**Cache issues:**
- Clear cache: `mcpreg config clear-cache`
- Check cache directory permissions
- Verify disk space

For more help, see the [main README](README.md) or [GitHub repository](https://github.com/trose/mcp-registry-cli).
