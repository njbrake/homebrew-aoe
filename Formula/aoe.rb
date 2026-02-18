class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.12.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.3/aoe-darwin-arm64.tar.gz"
      sha256 "73dfe1f97bce9e23d464566aa386f8c9728f133d5e4033d813da1a8f3ada0e9c"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.3/aoe-darwin-amd64.tar.gz"
      sha256 "c5fd8e53dcee4cd29c1b87cf90e4463fc15cd64d376d420c235590dcc6621091"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.3/aoe-linux-arm64.tar.gz"
      sha256 "0731e4180480ab99be599c926d88d9e93b1555988ad435eb29a9f0b1d92daad9"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.3/aoe-linux-amd64.tar.gz"
      sha256 "5b84cdd1bc92c640782851821035b68b01506464df6938b0d9076db69de07cc6"
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
