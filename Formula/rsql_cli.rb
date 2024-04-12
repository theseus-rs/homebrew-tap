class RsqlCli < Formula
  desc "rsql is a CLI for DuckDB, LibSQL, MariaDB, MySQL, PostgreSQL, SQLite3 and SQL Server."
  homepage "https://github.com/theseus-rs/rsql"
  version "0.11.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.11.1/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "c37b9b6bfb042c68d2084e3bc1adddb834bc917230f35c0819d5fd6a35cf33d2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.11.1/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "694d218d800420f0093c35681db269c34b25387351c1a01f853552f6b4743bcf"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.11.1/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7314b69cf6d45b58d3cf4e037dfed4ba91fd8ff86b9425aad9a5f5540f1790c3"
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
