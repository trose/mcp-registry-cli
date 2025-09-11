# MCP Registry CLI

A pleasant-to-use command-line tool for the MCP Registry

[![CI](https://github.com/trose/mcp-registry-cli/workflows/CI/badge.svg)](https://github.com/trose/mcp-registry-cli/actions)
[![Version](https://img.shields.io/badge/version-0.2.1-blue.svg)](https://github.com/trose/mcp-registry-cli)
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
- [Commands](#commands)
- [Publishing to the Registry](#publishing-to-the-registry)
- [Configuration](#configuration)
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

| Command | Description | Example |
|---------|-------------|---------|
| `search <query>` | Search for MCP servers (supports fuzzy matching) | `mcpreg search filesystem` |
| `list [limit]` | List available servers | `mcpreg list 50` |
| `installed` | List installed MCP servers | `mcpreg installed` |
| `install <name>` | Install an MCP server (supports fuzzy matching) | `mcpreg install filesystem` |
| `info <name>` | Get server details (supports fuzzy matching) | `mcpreg info filesystem` |
| `uninstall <name>` | Uninstall an MCP server (supports fuzzy matching) | `mcpreg uninstall filesystem` |
| `update [name]` | Update installed servers (all or specific) | `mcpreg update filesystem` |
| `config [action]` | Manage configuration | `mcpreg config show` |
| `auth` | Authenticate with GitHub CLI | `mcpreg auth` |
| `commands` | List all available commands | `mcpreg commands` |
| `--help, -h` | Show help message | `mcpreg --help` |
| `--version, -v` | Show version information | `mcpreg --version` |

**📖 For detailed usage instructions, see [USAGE.md](USAGE.md)**

## Publishing to the Registry

Want to publish your own MCP server to the registry? The MCP Registry team provides comprehensive documentation on how to publish servers.

**📚 [Official Publishing Guide](https://github.com/modelcontextprotocol/registry/blob/main/docs/guides/publishing/publish-server.md)**

The publishing process typically involves:
1. Preparing your MCP server for distribution
2. Publishing to npm or PyPI package registries
3. Submitting your server to the MCP Registry
4. Following the registry's guidelines and requirements

For the most up-to-date publishing instructions, requirements, and best practices, please refer to the official documentation linked above.

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `GITHUB_TOKEN` | GitHub authentication token | - |
| `GITHUB_AUTH_TOKEN` | Alternative GitHub token | - |
| `MCP_REGISTRY_BASE_URL` | Registry base URL | `https://registry.modelcontextprotocol.io` |
| `MCP_CACHE_DIR` | Cache directory | `~/.cache/mcpreg` |
| `MCP_CONFIG_DIR` | Config directory | `~/.config/mcpreg` |

**📖 For detailed configuration and usage examples, see [USAGE.md](USAGE.md)**

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
