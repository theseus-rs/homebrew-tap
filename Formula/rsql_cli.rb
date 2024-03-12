class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.1.4"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.4/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "d7d043fa5056c3b3115cd7fe9801ff64d46d25bfe05b0777db9efe332f876c1a"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.4/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "c87a6799c2aa9bc80936edd1fa4c4aa2595b68673b4ec092a45b80a9670ff954"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.4/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "fe76bd932c3c6b0e125f8c1392779b93e4d6d563fe472e40ce662efc9e9308fe"
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
