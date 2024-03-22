class RsqlCli < Formula
  desc "rsql is a command line interface for PostgreSQL and SQLite3."
  version "0.7.1"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.1/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "0d759226830a7a59e9dab30700bc7a8b558e3fd536073c466eafdc958d063f2a"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.1/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "cc906d4a4f162cf1af8a1606adf93b1234ebcf6448283f6e59a78921ccd9f568"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.1/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "98c106b0a1fabb00954bf929c1ff36df397c5b3a36dd36427da07456741337a4"
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
