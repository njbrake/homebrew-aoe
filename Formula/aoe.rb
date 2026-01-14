class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.0/aoe-darwin-arm64.tar.gz"
      sha256 "8d777fe6118edf2732d1ebf097dc67e5fc7c20d9425f8e9338aa00633adf73ed"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.0/aoe-darwin-amd64.tar.gz"
      sha256 "3a913c515c862ebc44b8a1e2e6147cfb53d659f9f11b3872d0f153ccd4dae7f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.0/aoe-linux-arm64.tar.gz"
      sha256 "86792e3bce2b6f40606fcc250980356790eb3cfce74d521cbc5a7bc82b83aa62"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.0/aoe-linux-amd64.tar.gz"
      sha256 "b17f504a4c5bf620b35d8033e86160fb978f2a3b52ef20190b43574bfde7e286"
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
