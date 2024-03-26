class RsqlCli < Formula
  desc "rsql is a command line interface for PostgreSQL and SQLite3."
  version "0.7.4"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.4/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "519a150ed7f4bb9e662a0da64a44fd2d169d4479cc7fc0fc8273fedc8313c5e4"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.4/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "2d64985980328b93fa8a2bc5c8a2036f494c4b8333e5ce5a5c930ed99a2aa168"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.4/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "85d231aa7c67b802af0e3743149198662f92e8cb98a3239ada65731ae933792d"
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
