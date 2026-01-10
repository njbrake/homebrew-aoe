class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.8/aoe-darwin-arm64.tar.gz"
      sha256 "8382b8cf7464ab79e64c18831916cc86d61d69a6d33dedcdeb6d8c1fb8e7fc88"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.8/aoe-darwin-amd64.tar.gz"
      sha256 "899af6919be3be1ea120b069b0e86fb8d9fb4b16c63f5d82d03a4c3c19748dd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.8/aoe-linux-arm64.tar.gz"
      sha256 "9ac600dbf526f03840e9fe4d0ab9d116dc93dd3aee01ce7a97ab7ce5d5e214d6"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.8/aoe-linux-amd64.tar.gz"
      sha256 "42645cc1fb3f67a2a52a1666427da2c097b1afe6173a54c529fd09f78e029abb"
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
