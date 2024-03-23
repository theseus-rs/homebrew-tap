class RsqlCli < Formula
  desc "rsql is a command line interface for PostgreSQL and SQLite3."
  version "0.7.2"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.2/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "385c767073d2763eef1881efdf16ef7c9e72250c086fcdfa35777fa722e9f4bd"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.2/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "f8abe3fe108c79cfb0fb4ae5577a2e84ae9cdb3b6ba4e4d845c8a014551fce06"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.2/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3406b78cf49c3e442364fd6f6d22dd0be9106d04cf58fa3ea824b86ec565cf1c"
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
