class RsqlCli < Formula
  desc "rsql command-line interface for PostgreSQL and SQLite3."
  version "0.1.0"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "54e6f4e4cf32dbc82936b70f4bb40dc654dee7f9eb1d6dd9177525fd77b45565"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "5e529a537f7e20baffba57f59c5a90b9264422d3978b8e28adf7e645a43df730"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "703433c73bcd616fa641d7610d06f7a4acfa0bdd523bd84538c438dd2e154f74"
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
