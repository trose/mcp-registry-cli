class Mcpreg < Formula
  desc "Pleasant-to-use command-line tool for the MCP Registry"
  homepage "https://github.com/trose/mcp-registry-cli"
  url "https://github.com/trose/mcp-registry-cli/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "3c681aab02f3ac8e0aaf23c84278f5a53759199bd954c86f67f0119fc375a85c"
  license "MIT"
  head "https://github.com/trose/mcp-registry-cli.git", branch: "main"

  depends_on "jq"

  def install
    bin.install "src/mcpreg"
  end

  test do
    # Test basic functionality
    assert_match "MCP Registry CLI", shell_output("#{bin}/mcpreg --help")
    assert_match "version 0.2.3", shell_output("#{bin}/mcpreg --version")
    # Test that it can run without errors
    system bin/"mcpreg", "commands"
  end
end
