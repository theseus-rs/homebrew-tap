class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.6.0"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.6.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "b505aec4b5a353d23cfd545c62d817de702f11aed67572869c8aae3da73a6571"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.6.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "240a4bfc5e396f82d1a76dcea249c337e9e28045dce585f05e620c041bdbe44b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.6.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e67a476ee743bf2523999a5243821a0345e9402b184bb991f8310493d37e8516"
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
