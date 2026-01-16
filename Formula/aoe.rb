class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.4/aoe-darwin-arm64.tar.gz"
      sha256 "2efb8d92ef29f27d223d1af3e01cb77682911e174b2ccc48bfe9c907dcd978a9"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.4/aoe-darwin-amd64.tar.gz"
      sha256 "04c3722198662e1f6ad3ecd4ed2d5276e2899643ea9ed119d3a9d1054b4f97ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.4/aoe-linux-arm64.tar.gz"
      sha256 "6afb42b0e833f3247c014b19e1281ee0cca732337d32e14d857d2baebd65f298"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.4/aoe-linux-amd64.tar.gz"
      sha256 "3b5eb815d38b7e944e4dc61b7a52e59869b716f77c2fb67020eedd39113d25b2"
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
