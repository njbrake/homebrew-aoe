class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.1/aoe-darwin-arm64.tar.gz"
      sha256 "2714dbf20cbf66ffbfe7881093a2706d3e5651bd95f3f12a4ca64a0c3bd8a03f"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.1/aoe-darwin-amd64.tar.gz"
      sha256 "0dcbebaa62100474870becc67b7afc30abe95111522309e935ba8e324cd78e00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.1/aoe-linux-arm64.tar.gz"
      sha256 "dded33f5c4e5bc36a74f908d2cde1e1b7d057158fb9f9c38a963841febb3b2ed"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.1/aoe-linux-amd64.tar.gz"
      sha256 "bd0443aa8e8a37011b49ecf8c6bdc7a7f3d821bb6d791fc5402e67533b92a6a4"
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
