class RsqlCli < Formula
  desc "rsql is a command line interface for PostgreSQL and SQLite3."
  version "0.7.3"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.3/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "bf380961205b61c1a6f3a6bdb656368ebf5d74de00616870ac682974a9d8164e"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.3/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "121eccd44c7866c3c620311d0c611691a0dbd1c0e6ec0f1134cbf3fdf9c8de72"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.3/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8080c48b371284e824b1fe427261c77b2cb999dbcb0b10937c2addf4bcc39705"
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
