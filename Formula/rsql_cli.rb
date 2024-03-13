class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.2.0"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.2.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "53bf5288587eafa0ec64dcbefcbcbecca266f3151f6e011e5b13ed514d66c489"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.2.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "d5e04b4e71e4a521f2c8ee84ac5a3238fe35d56f477099003a743857580c4267"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.2.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "da6c5822ef541eb2f65b6103deab05ee7d81f297d3178db3a57ce6a0a7380832"
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
