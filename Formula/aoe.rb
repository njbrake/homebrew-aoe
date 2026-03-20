class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.17.1/aoe-darwin-arm64.tar.gz"
      sha256 "a6d733cac0adafe223b83f71643406264d30454891621fab84f64b875ea67fe7"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.17.1/aoe-darwin-amd64.tar.gz"
      sha256 "2d4494307046685d7c1e1340051b43cb6deef74923e61499bfa445f7039d49a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.17.1/aoe-linux-arm64.tar.gz"
      sha256 "40c83f03519e666a431ed27c408a3dece9d05c0b69685b8d3d898f077e3ff345"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.17.1/aoe-linux-amd64.tar.gz"
      sha256 "a5d59e8368b55ad38af5d95bfa13293aa1bcf4f1d8ba4784c3bfc38f58381dbc"
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
