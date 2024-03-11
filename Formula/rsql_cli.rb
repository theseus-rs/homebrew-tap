class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.1.1"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "bbe780683b6a1cb33e4a26ff5455620c0a7d8393c622c46de4a28a2a36e33afd"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "f27de8768640dc1c776c6e14c886732374f372fc5a190f3d1f91b46c8ede3cba"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bf32b29557b6c8bf93b80f2ab68281d56edf9882d5e8b090cf8579e8234a597c"
    end
  end
  license "Apache-2.0 OR MIT"

  def install
    on_macos do
      on_arm do
        bin.install "rsql"
      end
    end
    on_macos do
      on_intel do
        bin.install "rsql"
      end
    end
    on_linux do
      on_intel do
        bin.install "rsql"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
