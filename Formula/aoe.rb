class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v#{version}/aoe-darwin-arm64.tar.gz"
      sha256 "e9c67d1feeb09225cda7205416ecd1d184d0234e499f949a1b6eaa0c51ba7e32"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v#{version}/aoe-darwin-amd64.tar.gz"
      sha256 "011994e77ac6b88633a78126075e1ce7c90bcf7c672e1432dafb0200392915fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v#{version}/aoe-linux-arm64.tar.gz"
      sha256 "f3f537df27ee12792906f7d2cf6346c2551fffa734f7deb4b3f1e10beba1dc9c"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v#{version}/aoe-linux-amd64.tar.gz"
      sha256 "6b158357f66abce82d13402782d604c21f8d15c5d89f29af0e6e024644b8abf0"
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
