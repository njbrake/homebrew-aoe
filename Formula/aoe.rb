class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.12.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.2/aoe-darwin-arm64.tar.gz"
      sha256 "2766e038c16dfe1887d0467b15ea40926ae5d3ff9958eec8822cfb73f9676bef"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.2/aoe-darwin-amd64.tar.gz"
      sha256 "304e08aa500eeb956fe218a699bcedcebbe3949dcc8bb1623bc4ac90252076d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.2/aoe-linux-arm64.tar.gz"
      sha256 "817d99a3ca1bd32968734f97eab0badd218f61f2cee42bd6181c3ea19f64b9fe"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.2/aoe-linux-amd64.tar.gz"
      sha256 "be42feb757cb785f5e8b1abd7694fe2d3f955453fc3cd8611d21d3bb3881842f"
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
