class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.10/aoe-darwin-arm64.tar.gz"
      sha256 "d4004f1581048dcf0b71875191444dad578624fce39121622c7338529da5afe8"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.10/aoe-darwin-amd64.tar.gz"
      sha256 "001752ee338c44371cd457bcda5e2f6c9d751006867039f7547e9729def96fd8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.10/aoe-linux-arm64.tar.gz"
      sha256 "4151e6e0a56b7532873006ccd3d69a69f69c09ceb588fc5b39448d9f865e68e6"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.10/aoe-linux-amd64.tar.gz"
      sha256 "e4bda73cf2c23e4e6a450b824fd1da0971aa97904d6171718731ec7a32482077"
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
