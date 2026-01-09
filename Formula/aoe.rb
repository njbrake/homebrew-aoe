class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.6/aoe-darwin-arm64.tar.gz"
      sha256 "0a9faaef0357a5056b12ae98c0366667a6b8da14cf7eb6acca5290b6537f9cf8"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.6/aoe-darwin-amd64.tar.gz"
      sha256 "6793fed3feebad65e920140717f113e6edd0128b72ba2a01864bc6d546bc5ef9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.6/aoe-linux-arm64.tar.gz"
      sha256 "5b6e739453dc5675a936caebaace7da92451596b38b6d7d6464ab2ecc125eaf8"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.6/aoe-linux-amd64.tar.gz"
      sha256 "4c43338cd0081df14e550c739bf8f7c78bfc885934044ee4f4879e5d4a286741"
    end
  end

  depends_on "tmux"

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
