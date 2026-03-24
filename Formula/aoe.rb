class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.18.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.18.1/aoe-darwin-arm64.tar.gz"
      sha256 "196453f4b06624ea8cc0134803ad116a40c3dd4efb51506cd2b2079c971ceeec"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.18.1/aoe-darwin-amd64.tar.gz"
      sha256 "6b1698d5c667b6c3a393aae4129cd89bef2e9ef25ff1f4e813711f207c951283"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.18.1/aoe-linux-arm64.tar.gz"
      sha256 "9ea0fd6dada272208a86063bb489baa4db15034bd4a56696b9800698cd48cb69"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.18.1/aoe-linux-amd64.tar.gz"
      sha256 "ad9b7cb1a92e9c78ef3d5c27436e8c5020ce1050df184cda0abbf2a4de1fe91a"
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
