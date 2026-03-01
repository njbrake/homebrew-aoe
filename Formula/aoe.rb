class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.1/aoe-darwin-arm64.tar.gz"
      sha256 "63598d25b093793d1faff851034428300294e08ae61f860a506ef2e37621251a"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.1/aoe-darwin-amd64.tar.gz"
      sha256 "4f9d915a7012da8c64c56086dbb2163ce8ae09123f8cccebcb5aa09f49690305"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.1/aoe-linux-arm64.tar.gz"
      sha256 "cd64165e22e37a5b9292694df3d71fbf204920bbf8ab3ba1e85784ffcd6026bf"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.1/aoe-linux-amd64.tar.gz"
      sha256 "ada086e54cfe5960fa9bd7888ba8e4b344541952e95e2b4cfd3cbbe135d1784c"
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
