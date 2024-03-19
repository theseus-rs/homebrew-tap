class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.5.1"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.5.1/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "1d40040c59056d4e5c742d78b3b143e8202639d64354f71745623764e5df12bd"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.5.1/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "5fff6d07bd2a9142a23a63f640777d7984dcc1aafce7233b2cc84e43bd6c1b66"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.5.1/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a46b626c2731e56f862ba8e645773618c33a7d9b56094dd145790492c40f7fdc"
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
