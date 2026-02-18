class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.12.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.3/aoe-darwin-arm64.tar.gz"
      sha256 "f3a0623abbf064ace005f8e9562f6eaad851fba5fbf417eb6ac4d44eaf501c43"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.3/aoe-darwin-amd64.tar.gz"
      sha256 "ca180ed11120db66b6cd829245b1ae959cb93d7c61aff470a1673e2638e783d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.3/aoe-linux-arm64.tar.gz"
      sha256 "cca8986c7c5f78e5a9a6f959f689f8cf6f198359d0b42ea271d2e506f2f585c1"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.3/aoe-linux-amd64.tar.gz"
      sha256 "7dc451bb26bcc56f2dd582c8606316564b5c9a9d1450f1964979b72c7cbb961d"
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
