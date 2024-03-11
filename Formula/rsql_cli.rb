class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.1.1"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "f39b5487e42e409f7a5e572438b55245f3e243b644b0e66e90d8a859d07625c4"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "eacf3e1f68bc035fb5c1b45201954ac463efe9a5163ffddd4070f2eb8288d561"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "25f62685bfe43346277a396387dab77a861f6d9a29afb38d76a6685c12694ac0"
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
