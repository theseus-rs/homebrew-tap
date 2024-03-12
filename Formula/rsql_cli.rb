class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.1.3"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.3/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "6ecaa4ade8b959feb7e356feff4cb06af937efd7ebbf87ad7227f21dd903b95f"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.3/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "5b7c70782c9d627acda6a928fdc2c2eb7ffc6ef7d3ffeb4a824bfa653db501a8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.3/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "338edb79ea20d04f3a96f9f2148d2878fb9472d1fe53b69474aecbd847191c48"
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
