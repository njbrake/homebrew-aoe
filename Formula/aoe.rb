class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.2/aoe-darwin-arm64.tar.gz"
      sha256 "46a12b057deeaf8e7fb75995882bb775527fc31de9b36d931397e0d6dd2eea9b"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.2/aoe-darwin-amd64.tar.gz"
      sha256 "49758784c6203a3e4bb8a9053581c03b7022cffbc8e312567769ab486372070d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.2/aoe-linux-arm64.tar.gz"
      sha256 "2de8796e3902d731bbb0912e9f8b9d838aadb07c19f9d84f3b050ce9fd0b60ad"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.2/aoe-linux-amd64.tar.gz"
      sha256 "f78df388717d3a3c79f98b26a1625d98a8cdaa1cd726e5f73003c4c853765afa"
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
