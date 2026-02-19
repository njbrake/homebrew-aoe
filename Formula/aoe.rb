class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.12.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.4/aoe-darwin-arm64.tar.gz"
      sha256 "590c42161f2be05a2d5ef492628cda08bd06292385f2a2e148481e9e7c593d22"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.4/aoe-darwin-amd64.tar.gz"
      sha256 "34e066b0bb6986e1865818dcde1de0ea6b9e394c462bd3b956cb914a0ea84aef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.4/aoe-linux-arm64.tar.gz"
      sha256 "bb3f02f9f0a0c398ceec3468f0c934d1cfb4852c30e83d972461f2e7ec61a5d0"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.4/aoe-linux-amd64.tar.gz"
      sha256 "62633d7b20a85d9a2bf56a2ec929900c4448e675f9bbf945ea4fc8f0edd51a2d"
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
