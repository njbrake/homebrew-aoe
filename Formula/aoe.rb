class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.1/aoe-darwin-arm64.tar.gz"
      sha256 "4e00553c4f5b726a93f544df114e79baa6e6db1ad931504742076a354328e39e"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.1/aoe-darwin-amd64.tar.gz"
      sha256 "b30f61db5c7c0acf0253cb3e455cb2fadb6e1cc9604cef910726a84b3b8f8ee3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.1/aoe-linux-arm64.tar.gz"
      sha256 "3219ad85b0d98a4a3d89abcd9549c7d1d0e741b72e9ae8e4a5c9aa12b4a3ed80"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.12.1/aoe-linux-amd64.tar.gz"
      sha256 "16c051ba8ca76aab4301191642e39df81206aead7249a2614f20896af7c42f63"
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
