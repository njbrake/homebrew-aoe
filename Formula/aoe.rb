class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.5/aoe-darwin-arm64.tar.gz"
      sha256 "b20c3381ed115fc26cfc50bd017c6e53f765b59b512d273800ecc5e6740bfae9"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.5/aoe-darwin-amd64.tar.gz"
      sha256 "76daf59569ad10303765fcd4c11a6d00ea4be37d0f78b88e5edbda03b6774325"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.5/aoe-linux-arm64.tar.gz"
      sha256 "d5a4bb6d83718ba1fcfb83805a8ada8e1215d4f60d862344db043f58fafc07ac"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.5/aoe-linux-amd64.tar.gz"
      sha256 "79aaa9c1826a32dcd966dc919800c0d784f28b6795640420488741c37c55932a"
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
