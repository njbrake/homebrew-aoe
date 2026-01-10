class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.7/aoe-darwin-arm64.tar.gz"
      sha256 "31a3f1fe814e23637ff77b1596692de5b8c1c71e538d40aeefedf70fdce8bdbe"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.7/aoe-darwin-amd64.tar.gz"
      sha256 "4d406719d8f1d1796a9e90020b6213598368e1c9fdabd4f46341d61b4ce06709"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.7/aoe-linux-arm64.tar.gz"
      sha256 "52d65773986206ed564fb7b6b26d60ccc7819765715968996ee116f6169f2c2a"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.7/aoe-linux-amd64.tar.gz"
      sha256 "4ccd0d3ea55e859fb8aae211c81fa983aca2ac919fdafd7d13db2f0585237e2d"
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
