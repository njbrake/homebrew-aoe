class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.2/aoe-darwin-arm64.tar.gz"
      sha256 "f602c808ed523718873171e54f6d6b329fb1f286eee2b4b9f020fd283efa28f0"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.2/aoe-darwin-amd64.tar.gz"
      sha256 "49fb50afabac5a4e975f8e325918ffc049970fb2a45a70e7af14f1d34b6b8cb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.2/aoe-linux-arm64.tar.gz"
      sha256 "8155c72b24b5ea2766ec765693d4c7e24d6195f49ae00bfc20a370e34b4310aa"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.2/aoe-linux-amd64.tar.gz"
      sha256 "0e8695ef68f9a5bfc6c226c7cf0060d0c10606976e899aecac3e9371edaa6901"
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
