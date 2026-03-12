class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.16.0/aoe-darwin-arm64.tar.gz"
      sha256 "c244660355ec26cde2c96b5937378037f78358123d813f8d7d43aa230ae631a3"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.16.0/aoe-darwin-amd64.tar.gz"
      sha256 "50e3d759c5080234797515d06dcff99472efffc6f038a3bca9fb1110dd83ce8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.16.0/aoe-linux-arm64.tar.gz"
      sha256 "f016a680388e024cf74224c92cff7e820d8b5030dc06924d0bd3ad08a70203d2"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.16.0/aoe-linux-amd64.tar.gz"
      sha256 "8bd6e1f6bc88a329394cb20ec26695f35b324ac881c0d6e0732c4c40d0b20a33"
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
