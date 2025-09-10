class Mcpreg < Formula
  desc "A pleasant-to-use command-line tool for the MCP Registry"
  homepage "https://github.com/trose/mcp-registry-cli"
  url "https://github.com/trose/mcp-registry-cli/archive/v0.0.1.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  head "https://github.com/trose/mcp-registry-cli.git", branch: "main"

  depends_on "curl"
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
