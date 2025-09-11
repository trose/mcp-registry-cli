# MCP Registry CLI

A pleasant-to-use command-line tool for the MCP Registry

[![CI](https://github.com/trose/mcp-registry-cli/workflows/CI/badge.svg)](https://github.com/trose/mcp-registry-cli/actions)
[![Version](https://img.shields.io/badge/version-0.0.1-blue.svg)](https://github.com/trose/mcp-registry-cli)
[![Downloads](https://img.shields.io/badge/downloads-homebrew-brightgreen.svg)](https://formulae.brew.sh/formula/mcpreg)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20Windows-lightgrey.svg)](https://github.com/trose/mcp-registry-cli)
[![Powered by Cursor/Claude](https://img.shields.io/badge/powered%20by-Cursor%2FClaude-purple.svg)](https://cursor.sh)

<details>
<summary><b>Table of Contents</b></summary>

- [Overview](#overview)
  - [Web Access](#web-access)
- [Features](#features)
- [Installation](#installation)
  - [Homebrew (Recommended)](#homebrew-recommended)
  - [Manual Installation](#manual-installation)
- [Quick Start](#quick-start)
- [Usage](#usage)
  - [Search Servers](#search-servers)
  - [List Servers](#list-servers)
  - [Get Server Information](#get-server-information)
  - [Configuration](#configuration)
  - [Authentication](#authentication)
- [Configuration](#configuration-1)
- [Examples](#examples)
- [Development](#development)
- [Contributing](#contributing)
- [License](#license)
- [Support](#support)

</details>

## Overview

`mcpreg` is a command-line interface for the [MCP Registry](https://registry.modelcontextprotocol.io), providing easy access to discover, search, and manage Model Context Protocol (MCP) servers. Built with simplicity and user experience in mind, it offers seamless authentication, intelligent caching, and graceful error handling.

### Web Access

You can also browse the MCP Registry through the web interface at [https://registry.fastmcp.cloud/](https://registry.fastmcp.cloud/). This public website provides a browseable view of the entire official MCP registry, updated every 30 minutes, with deduplication by domain for a clean browsing experience.

## Features

- **Search & Discovery** - Find MCP servers by name or description
- **Server Listing** - Browse available servers with pagination
- **Detailed Information** - Get comprehensive server details including packages and remotes
- **Seamless Authentication** - Automatic GitHub token detection with browser fallback
- **Smart Caching** - Local caching with configurable TTL for faster responses
- **Configuration Management** - Easy setup and cache management
- **Cross-Platform** - Works on macOS, Linux, and Windows (WSL)
- **Fast & Reliable** - Graceful degradation when API is unavailable

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

## Quick Start

### Basic Usage

```bash
# Search for servers
mcpreg search filesystem

# List available servers
mcpreg list

# Get detailed server information
mcpreg info io.modelcontextprotocol/filesystem

# Show configuration
mcpreg config

# Clear cache
mcpreg config clear-cache
```

### Authentication Setup

For seamless authentication, set up a GitHub token:

```bash
# Add to your shell profile (~/.bashrc, ~/.zshrc, etc.)
export GITHUB_TOKEN="your_github_token_here"

# Or use the alternative variable name
export GITHUB_AUTH_TOKEN="your_github_token_here"
```

Create a token at: https://github.com/settings/tokens

## Commands

### Core Commands

| Command | Description | Example |
|---------|-------------|---------|
| `search <query>` | Search for MCP servers | `mcpreg search filesystem` |
| `list [limit]` | List available servers | `mcpreg list 50` |
| `info <name>` | Get server details | `mcpreg info io.modelcontextprotocol/filesystem` |
| `config [action]` | Manage configuration | `mcpreg config show` |

### Configuration Commands

| Command | Description |
|---------|-------------|
| `config show` | Show current configuration (default) |
| `config clear-cache` | Clear all cached data |
| `config cache-info` | Show detailed cache information |

### Utility Commands

| Command | Description |
|---------|-------------|
| `commands` | List all available commands |
| `--help, -h` | Show help message |
| `--version, -v` | Show version information |

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `GITHUB_TOKEN` | GitHub authentication token | - |
| `GITHUB_AUTH_TOKEN` | Alternative GitHub token | - |
| `MCP_REGISTRY_BASE_URL` | Registry base URL | `https://registry.modelcontextprotocol.io` |
| `MCP_CACHE_DIR` | Cache directory | `~/.cache/mcpreg` |
| `MCP_CONFIG_DIR` | Config directory | `~/.config/mcpreg` |

### Cache Management

The CLI automatically caches API responses for 5 minutes by default. You can manage the cache:

```bash
# View cache information
mcpreg config cache-info

# Clear cache
mcpreg config clear-cache

# Show configuration
mcpreg config
```

## Examples

### Search and Discovery

```bash
# Search for filesystem-related servers
mcpreg search filesystem

# Search for git servers
mcpreg search git

# List first 10 servers
mcpreg list 10
```

### Server Information

```bash
# Get detailed information about a server
mcpreg info io.modelcontextprotocol/filesystem

# This shows:
# - Server name and description
# - Version and status
# - Available packages (npm, pip, etc.)
# - Remote configurations
```

### Configuration Management

```bash
# Check current setup
mcpreg config

# Clear cache if you're having issues
mcpreg config clear-cache

# View cache details
mcpreg config cache-info
```

## Error Handling

The CLI is designed to be resilient and user-friendly:

- **API Unavailable**: Shows helpful messages and example data
- **Invalid Tokens**: Validates GitHub tokens and provides guidance
- **Network Issues**: Graceful fallback with clear error messages
- **Missing Dependencies**: Clear installation instructions

## Development

### Running Tests

```bash
# Install bats testing framework
# macOS
brew install bats-core

# Ubuntu/Debian
sudo apt-get install bats

# Run tests
bats tests/
```

### Building from Source

```bash
git clone https://github.com/your-org/mcp-registry-cli.git
cd mcp-registry-cli
chmod +x src/mcpreg
./src/mcpreg --help
```

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Development Setup

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Run tests: `bats tests/`
5. Commit your changes: `git commit -m 'Add amazing feature'`
6. Push to the branch: `git push origin feature/amazing-feature`
7. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built for the [Model Context Protocol](https://modelcontextprotocol.io) ecosystem
- Powered by [Cursor](https://cursor.sh) and [Claude](https://claude.ai)
- Inspired by the simplicity of great CLI tools like `brew`, `npm`, and `pip`

## Support

- [MCP Registry API](https://registry.modelcontextprotocol.io)
- [MCP Registry Web Interface](https://registry.fastmcp.cloud/) - Browse servers online

---

**Made with love for the MCP community**
