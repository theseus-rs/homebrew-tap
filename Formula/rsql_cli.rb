class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.4.0"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "dd18846525a657c2568a37dfd3a0252dfe981c75ac3c5bdb30e3e4eb1e1e8257"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "92d533a8bd15c6c79f3f6ca00eb08db28a01c7512d5b6ecd2ae7ba96db3ee1c7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1d1ecaa8d7348e2f1a245f110d509189e87c23047df16c4f6fc1708c0196dfc8"
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
