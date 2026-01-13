class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.0/aoe-darwin-arm64.tar.gz"
      sha256 "adad9796330120a390af62d51bec2f7d7e66f499beef6e5430b3d88b86dc9b68"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.0/aoe-darwin-amd64.tar.gz"
      sha256 "ea70049b1f6213ac301e6b4f55960f38a1071f99695b74c7064ceea105747313"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.0/aoe-linux-arm64.tar.gz"
      sha256 "c433fdfa48a61764509946bdb1aeb6f4e37739ac8365bd97cdf3f4f1dd410008"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.0/aoe-linux-amd64.tar.gz"
      sha256 "313c9d43797d2ce70a95dce56a40dcbb97f629794160c7d50c20b0d12685e3fe"
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
