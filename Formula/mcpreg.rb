class Mcpreg < Formula
  desc "A pleasant-to-use command-line tool for the MCP Registry"
  homepage "https://github.com/trose/mcp-registry-cli"
  url "https://github.com/trose/mcp-registry-cli/archive/v0.0.3.tar.gz"
  sha256 "8f761a7a93657949c996f30a49ac663be7cc3a3b8984eb854c1d6ae2d6432650"
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
