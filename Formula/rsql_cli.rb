class RsqlCli < Formula
  desc "rsql is a CLI for DuckDB, LibSQL, MariaDB, MySQL, PostgreSQL, SQLite3 and SQL Server."
  homepage "https://github.com/theseus-rs/rsql"
  version "0.13.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.13.2/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "b34aff6d594c02e5c02942d9cb063f45de50c4ec9dd50e3dfb53e603ccc2829d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.13.2/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "c76d5dd9ca2860032ed08e81842adffb76c828dd6fa3ee0e3962c9749dcb4d99"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.13.2/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3f21e451b068d8095dcd767a888cfcd6ff6a08244039dfd0ce1c987d261a8265"
    end
  end
  license "Apache-2.0 OR MIT"

  BINARY_ALIASES = {"aarch64-apple-darwin": {}, "x86_64-apple-darwin": {}, "x86_64-pc-windows-gnu": {}, "x86_64-unknown-linux-gnu": {}}

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

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

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
