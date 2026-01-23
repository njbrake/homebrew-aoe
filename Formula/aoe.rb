class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.6.2/aoe-darwin-arm64.tar.gz"
      sha256 "3323dc091498579fef6be0e940a2a2a93cc8f09198d76c7ee981f6a802175b96"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.6.2/aoe-darwin-amd64.tar.gz"
      sha256 "9ea53f1cfc86a9d89b7fb21b8fe87b282f55a04163ea477de767e362779194ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.6.2/aoe-linux-arm64.tar.gz"
      sha256 "11516dcf042861a999dbd3a78e56be20a074fadd70116b04d23e542a705af0ba"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.6.2/aoe-linux-amd64.tar.gz"
      sha256 "2c91f6b2fb0ed14939ddd0fe1b29e79e880438f8a975f58e043afa8e88940e04"
    end
  end

  depends_on "tmux"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "aoe-darwin-arm64" => "aoe"
      else
        bin.install "aoe-darwin-amd64" => "aoe"
      end
    else
      if Hardware::CPU.arm?
        bin.install "aoe-linux-arm64" => "aoe"
      else
        bin.install "aoe-linux-amd64" => "aoe"
      end
    end
  end

  test do
    assert_match "session manager", shell_output("#{bin}/aoe --help")
  end
end
