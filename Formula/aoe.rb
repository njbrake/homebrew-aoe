class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.2/aoe-darwin-arm64.tar.gz"
      sha256 "99fce33dd4dc9d3f16ba4c8b7e5c69a0e873cbbc3ae809d8c51128f3699e20af"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.2/aoe-darwin-amd64.tar.gz"
      sha256 "73b327e14e388527ca3bf098354642933b51fd99e23bbebb0a9073fdbd98c671"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.2/aoe-linux-arm64.tar.gz"
      sha256 "8be354bb675ae5e6e7c99864fed81c0162b85e05d634fc2fb60ba05312ca921d"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.2/aoe-linux-amd64.tar.gz"
      sha256 "74d720992128844766ef3929eb65bfe6ca4e5db92fa64c9a117402c7215e6742"
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
