class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.12.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.5/aoe-darwin-arm64.tar.gz"
      sha256 "afdd93d85f9597f5f9df847664d4e945680beacf93419b72cd98023bc0082e0e"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.5/aoe-darwin-amd64.tar.gz"
      sha256 "741d1c1d6225d5c916472c7db9ae2acb80d4ba0028a34dcb1e6073c8119ffb67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.5/aoe-linux-arm64.tar.gz"
      sha256 "a7c572fbadaf1eae69a853154ff3d7afcdd0b4459c774719b9ffcbd09cbba073"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.5/aoe-linux-amd64.tar.gz"
      sha256 "82ee69c6a120f15220f24822d86d173b5aecef80286637143bdc8b88dfb94a24"
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
