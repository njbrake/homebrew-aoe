class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.5.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.7/aoe-darwin-arm64.tar.gz"
      sha256 "f669893a8ed6009acd5b4188d0550fba43c3a161029b7ee8db5b22d1b3e5cfcf"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.7/aoe-darwin-amd64.tar.gz"
      sha256 "3872c2f587be2bc40335fd555c4a24b58e30b57e91a4ab2440672616c610e49e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.7/aoe-linux-arm64.tar.gz"
      sha256 "44d2bb65b1c92d8747ff2c927b2d50953167c202c0a48915757fc093d08d388b"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.7/aoe-linux-amd64.tar.gz"
      sha256 "95c3e8f4d6d5b754ceb076aa9efbebc76237a8ce84c3ee1f87c84f1704c5f1b2"
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
