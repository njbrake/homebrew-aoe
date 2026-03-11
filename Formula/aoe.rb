class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.1/aoe-darwin-arm64.tar.gz"
      sha256 "9521f2423f4abf510bb81bfa415d02104d542f46d316b7c1c69959b09eb151f2"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.1/aoe-darwin-amd64.tar.gz"
      sha256 "38f9e3268d011874deb92c3bc7b760dba626ca5252c04b532c3429df604c8efb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.1/aoe-linux-arm64.tar.gz"
      sha256 "c67c5595e0823dd0b6f1b616d36382db05b693610c232da7962895684110e6de"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.1/aoe-linux-amd64.tar.gz"
      sha256 "06fed4b1b6a87fb4e9e8247bb1f3a5ff8cc74dd2ed9a2f053dc0c17ee198a118"
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
