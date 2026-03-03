class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.13.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.2/aoe-darwin-arm64.tar.gz"
      sha256 "7565524a8963e80fe29c1377fee84b5ae5055c426ebfcf54ad878e5436a622f8"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.2/aoe-darwin-amd64.tar.gz"
      sha256 "0726149b6f90d5f735d7e136bf182f95e63a8764d6555b671b142a84955c7561"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.2/aoe-linux-arm64.tar.gz"
      sha256 "350978804405904b7766f968182d3bdac74973386b0b52a1fb80ad2b31095c13"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.2/aoe-linux-amd64.tar.gz"
      sha256 "f40a91c37d3ebdfc705c608c6c8c352536a334f3d657cf155144d9b8caaef055"
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
