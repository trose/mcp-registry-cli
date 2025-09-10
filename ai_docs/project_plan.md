# MCP Registry CLI - Project Plan

## Overview
A pleasant-to-use Bash CLI tool for interacting with the [MCP Registry](https://github.com/modelcontextprotocol/registry) REST API. Focus on KISS principle - Bash script only for maximum simplicity and cross-platform compatibility.

## Project Rules

### Development Rules
1. **Always use todo lists** when processing lists of instructions
2. **Compress context** when over 80% utilization
3. **Pleasant UX first** - prioritize user experience over feature completeness
4. **Simple over complex** - start minimal, iterate based on feedback
5. **Cross-platform compatibility** - ensure works on macOS, Linux, Windows (WSL)
6. **Comprehensive error handling** - graceful failures with helpful messages
7. **Semantic versioning** - follow semver for all releases
8. **Documentation-driven** - document before implementing
9. **Gitflow best practices** - always use proper branching, feature branches, pull requests, and release workflows

### Code Quality Rules
1. **Bash best practices** - use `set -euo pipefail`, proper quoting, error handling
2. **Minimal dependencies** - keep dependency tree short for security auditing
3. **Test coverage** - unit tests using bats framework
4. **CI/CD ready** - GitHub Actions for automated Homebrew publishing on releases

## Publishing Strategy

### Homebrew (Primary Distribution)
- **Process**: Create formula in `Formula/mcpreg.rb`
- **Requirements**: GitHub releases, proper shebang, executable permissions
- **Benefits**: Native macOS/Linux package manager, easy installation
- **Automation**: GitHub Actions workflow to auto-publish to Homebrew on version tags
- **Timeline**: Ready for immediate release after Bash script completion

## Bash-Only Strategy

**Decision**: Focus exclusively on Bash script following KISS principle:
- Maximum simplicity and maintainability
- Cross-platform compatibility (macOS, Linux, Windows WSL)
- Minimal dependencies for security
- Fast development and deployment
- Can expand to other languages later if needed

## Standard Open Source Project Requirements

### Repository Structure
```
mcp-registry-cli/
├── README.md                 # Main project documentation
├── LICENSE                   # MIT License
├── CONTRIBUTING.md          # Development guidelines
├── CODE_OF_CONDUCT.md       # Community standards
├── CHANGELOG.md             # Version history
├── .github/
│   ├── ISSUE_TEMPLATE/      # Issue templates
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows/           # GitHub Actions (Homebrew automation)
├── docs/                    # GitBook documentation
├── src/
│   └── mcpreg               # Main Bash script
├── tests/                   # Bats test suite
├── Formula/                 # Homebrew formula
└── ai_docs/                # AI-generated documentation
```

### Required Badges
- **Version**: Latest release version
- **Downloads**: Homebrew download counts
- **License**: MIT License badge
- **Cursor/Claude**: AI-powered development badge
- **Platform Support**: macOS, Linux, Windows compatibility

### README.md Requirements
- **Title**: "MCP Registry CLI" with subtitle "A pleasant-to-use command-line tool for the MCP Registry"
- **Badges** at the top (version, downloads, cursor/claude, license, platform support)
- **Installation**: Simple Homebrew install command
- **Quick start**: 2-3 essential commands with examples
- **Usage**: Brief command reference
- **Contributing**: Link to CONTRIBUTING.md
- **License**: MIT License
- **Keep it short and sweet** - focus on getting users up and running quickly

## Task List

### Phase 1: Bash CLI (MVP) - Target: Tonight!
- [x] **Brainstorm command line acronym/shorthand** - ✅ **DECIDED: `mcpreg`** (MCP Registry) - Clear, 6 chars, no naming conflicts, registry-focused
- [ ] Research MCP Registry API endpoints and authentication (GitHub OAuth/OIDC)
- [ ] Create basic Bash script structure with argument parsing
- [ ] Implement command structure: `mcpreg search`, `mcpreg list`, `mcpreg install`, `mcpreg info`, `mcpreg uninstall`, `mcpreg update`, `mcpreg config`, `mcpreg commands`, `mcpreg --help`
- [ ] Implement GitHub OAuth authentication flow (seamless if GITHUB_TOKEN/GITHUB_AUTH_TOKEN env vars exist, otherwise pop open auth dialog to github.com)
- [ ] Add local caching system with cascade: local -> remote -> central registry
- [ ] Add private registry integration support
- [ ] Implement human-readable output format
- [ ] Add JSON parsing and pretty-printing with jq (minimal dependencies)
- [ ] Implement help system and error handling
- [ ] Create comprehensive test suite using bats
- [ ] Write user documentation and examples
- [ ] Prepare Homebrew formula
- [ ] Set up GitHub Actions for automated Homebrew publishing on version tags
- [ ] Create GitHub releases and tags (starting with v0.0.1)

### Phase 2: Open Source Project Setup
- [ ] Create comprehensive README.md with badges, installation, usage examples
- [ ] Set up GitHub repository structure (docs/, .github/, etc.)
- [ ] Add standard open source badges (build status, version, downloads, etc.)
- [ ] Create CONTRIBUTING.md with development guidelines
- [ ] Add LICENSE file (MIT recommended)
- [ ] Set up GitHub Issues and PR templates
- [ ] Create CHANGELOG.md for version tracking
- [ ] Add CODE_OF_CONDUCT.md
- [ ] Set up GitHub Actions for CI/CD
- [ ] Create project website/documentation

### Phase 3: Community & Publishing
- [ ] Reach out to MCP Registry maintainers via GitHub Issue & email
- [ ] Submit to Homebrew core
- [ ] Gather user feedback and iterate
- [ ] Add usage metrics collection (future improvement)

## Key Decisions Made

### Scope & Functionality
- **API Coverage**: Stub out all endpoints, focus on common query patterns
- **Authentication**: GitHub OAuth & OIDC - seamless if GITHUB_TOKEN/GITHUB_AUTH_TOKEN env vars exist, otherwise pop open auth dialog to github.com
- **Output Format**: Human-readable only (unless good JSON use cases emerge)
- **Caching**: Local registry cache with cascade: local -> remote -> central registry
- **Private Registries**: Full integration support with easy configuration

### User Experience
- **Command Structure**: `mcpreg search`, `mcpreg list`, `mcpreg install`, `mcpreg info`, `mcpreg uninstall`, `mcpreg update`, `mcpreg config`, `mcpreg commands`, `mcpreg --help`
- **Configuration**: Simple environment variables (drop in .bashrc/.zshrc) - GITHUB_TOKEN/GITHUB_AUTH_TOKEN for seamless auth
- **Aliases**: Not a priority

### Publishing & Distribution
- **Package Names**: ✅ **DECIDED: `mcpreg`** - Clear, no namespace conflicts, registry-focused
- **License**: MIT (same as MCP Registry)
- **Repository Structure**: Monorepo (can split later if needed)

### Technical Decisions
- **Dependencies**: Minimal dependency tree for security auditing
- **Testing**: Bats framework
- **CI/CD**: GitHub Actions for automated Homebrew publishing on version tags
- **Versioning**: Start with v0.0.1, follow semver

### Open Source Project Standards
- **Badges**: Version, downloads, cursor/claude, license
- **Documentation**: GitBook + markdown in /docs/
- **Repository Structure**: Bash-only focus (KISS principle)

### Community & Outreach
- **MCP Registry Contact**: Reach out via GitHub Issue & email
- **Timeline**: Bash MVP tonight!
- **Success Metrics**: Downloads, stars, usage metrics (future improvement)

## Next Steps
1. ✅ Complete brainstorming for command name - **DECIDED: `mcpreg`**
2. Research MCP Registry API and authentication
3. Implement Phase 1 (Bash CLI) - Target: Tonight!
4. Iterate based on feedback
5. Future: Consider other languages based on demand

---

*This plan will be updated as we gather more information and make implementation decisions.*
