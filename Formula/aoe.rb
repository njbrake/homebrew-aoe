class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.2.2/aoe-darwin-arm64.tar.gz"
      sha256 "6aa00f7a8cbd1123c9348e86210129bf5e23c9c2875ebc6772f1f2ea0370b334"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.2.2/aoe-darwin-amd64.tar.gz"
      sha256 "aa760f4dcb691197e90bc91893bcfb7a96be69fcc4c56416057919b31880fda2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.2.2/aoe-linux-arm64.tar.gz"
      sha256 "da8fa8e28f95e4386ef51dfb419a8a3273ea1948fd29af56939c2b4fcb0847df"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.2.2/aoe-linux-amd64.tar.gz"
      sha256 "e67e70f46886a93791c78aae82b716347e2c010f63f6c264d1159c9fd03c0acc"
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
