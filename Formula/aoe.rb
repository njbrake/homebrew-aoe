class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.6.1/aoe-darwin-arm64.tar.gz"
      sha256 "04898b34a7fe8032183a01998cf788b39b6b0d7b6fe2b221453274c9e6148cbd"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.6.1/aoe-darwin-amd64.tar.gz"
      sha256 "128e8699cab1bd85aa9ba3450200eb46d44f49fbb291f935256be969e75b835d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.6.1/aoe-linux-arm64.tar.gz"
      sha256 "9f00adba79bcb3798e745bb10a9c729ffd2564e0167151bfb0c71b89180d8165"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.6.1/aoe-linux-amd64.tar.gz"
      sha256 "2e7779a459eed109d14eb84a293c4d27b7c7c150990e0327d3f1b61100b31bb7"
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
