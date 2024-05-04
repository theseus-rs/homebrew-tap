class RsqlCli < Formula
  desc "rsql is a CLI for DuckDB, LibSQL, MariaDB, MySQL, PostgreSQL, SQLite3 and SQL Server."
  homepage "https://github.com/theseus-rs/rsql"
  version "0.12.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.12.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "2cd168e76ba12edb3f051a8072c05ef46aea8c2bbc1abebace2adf36687c47a1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.12.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "34ae2d091b3480744797799a66b1ef89764fefc14612320616bf098f38360922"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.12.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "dd7994941e0a8c8758c5908ddcabcfaee35ae4f4cd94c2ddbec2acd640502a0f"
    end
  end
  license "Apache-2.0 OR MIT"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "rsql"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "rsql"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "rsql"
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
