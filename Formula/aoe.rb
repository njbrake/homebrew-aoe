class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.0/aoe-darwin-arm64.tar.gz"
      sha256 "478e6a234d38f2261fec3431b238c3fd482d26803204847d97a2b53aac2bb6ec"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.0/aoe-darwin-amd64.tar.gz"
      sha256 "6a830de1516da4096af1d5cbb0ed2b2d2904bba5f454784ca910f203009ff26d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.0/aoe-linux-arm64.tar.gz"
      sha256 "5c67abe02d18a9c0907e3f8e04bc7d9d6071e7b9d57a9e8862d98295a91f9b19"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.0/aoe-linux-amd64.tar.gz"
      sha256 "b8f501305e631590f23225f848292edffe346b3df9f97c72da5d949c46edfe3f"
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
