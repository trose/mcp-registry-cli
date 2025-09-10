# Contributing to MCP Registry CLI

Thank you for your interest in contributing to MCP Registry CLI! This document provides guidelines and information for contributors.

## Development Setup

### Prerequisites

- Bash 4.0+
- curl
- jq
- bats (for testing)

### Installation

```bash
# Clone the repository
git clone https://github.com/your-org/mcp-registry-cli.git
cd mcp-registry-cli

# Make the script executable
chmod +x src/mcpreg

# Test the installation
./src/mcpreg --help
```

### Dependencies

Install the required dependencies:

```bash
# macOS
brew install curl jq bats-core

# Ubuntu/Debian
sudo apt-get install curl jq bats

# CentOS/RHEL
sudo yum install curl jq bats
```

## Development Guidelines

### Code Style

- Follow bash best practices with `set -euo pipefail`
- Use meaningful variable names and comments
- Keep functions focused and single-purpose
- Use consistent indentation (2 spaces)

### Testing

Run the test suite before submitting changes:

```bash
# Run all tests
bats tests/

# Run specific test file
bats tests/mcpreg.bats
```

### Git Workflow

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/amazing-feature`
3. **Make** your changes
4. **Test** your changes: `bats tests/`
5. **Commit** with a clear message: `git commit -m 'Add amazing feature'`
6. **Push** to your fork: `git push origin feature/amazing-feature`
7. **Open** a Pull Request

### Commit Message Format

Use clear, descriptive commit messages:

```
feat: Add new search functionality
fix: Handle API timeout errors
docs: Update README with new examples
test: Add tests for config command
```

## Project Structure

```
mcp-registry-cli/
├── src/
│   └── mcpreg              # Main CLI script
├── tests/
│   ├── mcpreg.bats         # Test suite
│   └── test_helper.bash    # Test utilities
├── Formula/
│   └── mcpreg.rb           # Homebrew formula
├── .github/
│   └── workflows/          # GitHub Actions
├── README.md               # Project documentation
├── CONTRIBUTING.md         # This file
└── LICENSE                 # MIT License
```

## Areas for Contribution

### High Priority

- **Install/Uninstall Commands**: Implement package management functionality
- **Browser Authentication**: Add OAuth flow for GitHub authentication
- **Private Registry Support**: Add support for custom registry URLs
- **Enhanced Caching**: Implement cache invalidation and refresh strategies

### Medium Priority

- **Output Formatting**: Add JSON output option
- **Configuration File**: Support for config files in addition to env vars
- **Plugin System**: Allow extensions for custom functionality
- **Performance**: Optimize API calls and caching

### Low Priority

- **GUI Interface**: Optional graphical interface
- **IDE Integration**: VS Code/Cursor extensions
- **Advanced Search**: Full-text search capabilities
- **Analytics**: Usage statistics and telemetry

## Testing Guidelines

### Writing Tests

- Use the `bats` testing framework
- Test both success and failure cases
- Include edge cases and error conditions
- Mock external dependencies when possible

### Test Structure

```bash
@test "description of what is being tested" {
    # Arrange
    setup_test_environment
    
    # Act
    run command_under_test
    
    # Assert
    [ "$status" -eq 0 ]
    [[ "${output}" =~ "expected output" ]]
}
```

## Documentation

### README Updates

When adding new features:

1. Update the **Features** section
2. Add examples to the **Examples** section
3. Update the **Commands** table
4. Add any new environment variables

### Code Comments

- Document complex functions
- Explain non-obvious logic
- Include usage examples for public functions

## Release Process

1. **Version Bump**: Update version in script and formula
2. **Changelog**: Document changes in commit messages
3. **Tag Release**: Create version tag (e.g., `v0.1.0`)
4. **Automated**: GitHub Actions handles the rest

## Getting Help

- 📖 Check the [README](README.md) for usage examples
- 🐛 [Open an issue](https://github.com/your-org/mcp-registry-cli/issues) for bugs
- 💬 [Start a discussion](https://github.com/your-org/mcp-registry-cli/discussions) for questions
- 🔗 Join the [MCP community](https://modelcontextprotocol.io)

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold this code.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to MCP Registry CLI! 🚀
