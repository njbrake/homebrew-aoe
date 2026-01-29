class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.10.0/aoe-darwin-arm64.tar.gz"
      sha256 "d97e1605c7adfca89587eb64b2a0919fdb0bc0865bbb81fb93c70d7905e8c642"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.10.0/aoe-darwin-amd64.tar.gz"
      sha256 "0ff2f00fde6333ff16df6d4e14fb35991c276c04ec09ce405876613718a4d75f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.10.0/aoe-linux-arm64.tar.gz"
      sha256 "b986ec83da0a55ad981857d60b7941ddbac7ad8c87bc5aabafe9e449dfe0290b"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.10.0/aoe-linux-amd64.tar.gz"
      sha256 "dfb7eb4dcd75462b365335eef040562d5fff9b3f89e2d2b815d785bf37a3a67a"
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
