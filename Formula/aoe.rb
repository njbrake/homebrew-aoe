class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.0/aoe-darwin-arm64.tar.gz"
      sha256 "a9349892630867b05212c7f3af1e6340818768ffe4c41dc989b9fea686652628"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.0/aoe-darwin-amd64.tar.gz"
      sha256 "709a666c89481036a8dcfb1e6adbd15e9d752c5f2e7a062714292a95a8d54078"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.0/aoe-linux-arm64.tar.gz"
      sha256 "daea2ccd1b8a8ab81db12e14625726571e75de4261b81195cc2010c33a79c326"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.0/aoe-linux-amd64.tar.gz"
      sha256 "29b595f55eb0d7e515b456959791f23fe8f32d8393150f148158735c5b507026"
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
