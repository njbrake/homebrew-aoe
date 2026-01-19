class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.1/aoe-darwin-arm64.tar.gz"
      sha256 "76bf33282ab15667c696dbc7d1643509789f0e60d06cb95a6e939ddc3aff4f52"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.1/aoe-darwin-amd64.tar.gz"
      sha256 "fd483ea70865155380b227da1726f6de21064ba9cc310daa907090cda671ae96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.1/aoe-linux-arm64.tar.gz"
      sha256 "ee67549f8ed7e0a52fe8cf7487c44510c4f0e155d4c97dea2d2af86dd1eb76fe"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.1/aoe-linux-amd64.tar.gz"
      sha256 "8e3a8d4d8f5530a563ddd8d2bda2e7a958b05b6450f4eadda57ff9da8812742f"
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
