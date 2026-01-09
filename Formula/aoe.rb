class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.4/aoe-darwin-arm64.tar.gz"
      sha256 "3a9cbc6f69021699466b91e317522ada8d0edbfd42d7a2184edf58d63d332f38"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.4/aoe-darwin-amd64.tar.gz"
      sha256 "3a6580af8783f4f79186f9602c211e83c2ade85498c0174f6841fa87bb63707f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.4/aoe-linux-arm64.tar.gz"
      sha256 "f6ea1102d2fd58e0322f0a71e847f64cf13231dadc143850127cf8b69ab70311"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.4/aoe-linux-amd64.tar.gz"
      sha256 "87f8f70d514b169cc52bb8b2936a0ef95bc90ad99b1e0757aea1a91653c5a7ec"
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
