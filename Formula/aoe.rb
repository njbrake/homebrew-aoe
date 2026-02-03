class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.1/aoe-darwin-arm64.tar.gz"
      sha256 "c2d3bce0ea4c1f6463e27f82c89cd2b6e63da0f6a89b2526b19fd0f23f8ee5ca"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.1/aoe-darwin-amd64.tar.gz"
      sha256 "aff7132ad03b802baa9609f1004015ea63b341e6191776ffddc88bdd799b3f47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.1/aoe-linux-arm64.tar.gz"
      sha256 "fdeccd9b44eb1268bf24f59c447a7332909f183703a8c22ce9376b384f3208b3"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.1/aoe-linux-amd64.tar.gz"
      sha256 "7f7886b0323f2cb4633a5c7480f2f9fae7894252bb0fa39b599f8631d47d5429"
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
