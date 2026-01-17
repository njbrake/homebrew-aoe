class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.4.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.5/aoe-darwin-arm64.tar.gz"
      sha256 "16a160e8e99b3b2ea59b596f3af7b4ddbea941364979a688805c7503bfea6470"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.5/aoe-darwin-amd64.tar.gz"
      sha256 "cb09e4086a5c10a6334b825e81bca5cff3dc5b5679fdcb503eafc1ff118f725c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.5/aoe-linux-arm64.tar.gz"
      sha256 "defcf633328b45d02458c30ae1f62bc1372ff0e7c4c5d4d8b10fd5dda36122ab"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.5/aoe-linux-amd64.tar.gz"
      sha256 "ff9afcc77c66c51c985350e7a3fd7ca3fd34cad203a4f4144972136840147572"
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
