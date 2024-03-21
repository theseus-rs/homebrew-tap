class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.7.0"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "ef83d693fdf466837d59461b14a70511f31bf15de9cf6446b113604a91b82868"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "bf235679a6f102dbebf7342f7700b2fa486224e1c0caeb55487463639f8e6ee4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.7.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "76f7ff89b0dca2c5d77df351ffedf87f13816f329061c0da59bf0d9e056c9215"
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
