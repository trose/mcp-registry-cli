class Mcpreg < Formula
  desc "A pleasant-to-use command-line tool for the MCP Registry"
  homepage "https://github.com/trose/mcp-registry-cli"
  url "https://github.com/trose/mcp-registry-cli/archive/v0.0.4.tar.gz"
  sha256 "ac3f3a0c09c7c0985449278d219c6b1ce81c1821bc6a5a2584cc9f4f32e548ea"
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
