class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.0/aoe-darwin-arm64.tar.gz"
      sha256 "324ff193418a4d9d6c275da3550d4a2efb57c6e7d8302ef211f62e9c4f27ae55"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.0/aoe-darwin-amd64.tar.gz"
      sha256 "b5112dfd4b6d6fa5af9ee2fb56d1aeb317d260be72412ae521baae4248026774"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.0/aoe-linux-arm64.tar.gz"
      sha256 "c19cf09e1437eb16afda8fdc589c4cc51575733a7bf7be5cbd043435098f8242"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.0/aoe-linux-amd64.tar.gz"
      sha256 "47e680bf9e129b32e23e2c8c52939081300cb89697163f71aaa96dc891c25e66"
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
