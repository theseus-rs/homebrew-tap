class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.2.1"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.2.1/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "22802f0d521b9eea69cec831140920aae910706b9b8ada70bcc052cc02585f59"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.2.1/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "ba90763ed1bc08398a63d18e27b2e8ba35a1c1bd90135dc50a6957db6372643b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.2.1/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5f7ee7937043645e4453931495358d9e01856c8e35c7b87845e501fb1519576f"
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
