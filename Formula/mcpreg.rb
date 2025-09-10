class Mcpreg < Formula
  desc "A pleasant-to-use command-line tool for the MCP Registry"
  homepage "https://github.com/trose/mcp-registry-cli"
  url "https://github.com/trose/mcp-registry-cli/archive/v0.1.0.tar.gz"
  sha256 "aba97b629bd3d99d3cc13ee3c7cd368f5553c7658628c257c7d236b5c9c3de86"
  license "MIT"
  head "https://github.com/trose/mcp-registry-cli.git", branch: "main"

  depends_on "jq"

  def install
    bin.install "src/mcpreg"
  end

  test do
    # Test basic functionality
    assert_match "MCP Registry CLI", shell_output("#{bin}/mcpreg --help")
    assert_match "version 0.0.1", shell_output("#{bin}/mcpreg --version")
    
    # Test that it can run without errors
    system "#{bin}/mcpreg", "commands"
  end
end
