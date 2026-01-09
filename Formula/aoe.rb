class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/nbrake/agent-of-empires"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nbrake/agent-of-empires/releases/download/v#{version}/aoe-darwin-arm64.tar.gz"
      sha256 "REPLACE_WITH_SHA256_AFTER_FIRST_RELEASE"
    end
    on_intel do
      url "https://github.com/nbrake/agent-of-empires/releases/download/v#{version}/aoe-darwin-amd64.tar.gz"
      sha256 "REPLACE_WITH_SHA256_AFTER_FIRST_RELEASE"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nbrake/agent-of-empires/releases/download/v#{version}/aoe-linux-arm64.tar.gz"
      sha256 "REPLACE_WITH_SHA256_AFTER_FIRST_RELEASE"
    end
    on_intel do
      url "https://github.com/nbrake/agent-of-empires/releases/download/v#{version}/aoe-linux-amd64.tar.gz"
      sha256 "REPLACE_WITH_SHA256_AFTER_FIRST_RELEASE"
    end
  end

  depends_on "tmux"

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
