class RsqlCli < Formula
  desc "rsql is a CLI for CockroachDB, DuckDB, LibSQL, MariaDB, MySQL, PostgreSQL, Redshift, Snowflake, SQLite3 and SQL Server."
  homepage "https://theseus-rs.github.io/rsql/rsql_cli/"
  version "0.15.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.15.2/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "82ade98a981039e43e6c74e7428397e767b95db9182f5161c8f3da82ed838559"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.15.2/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "c7e3d462dd1b66ae0c8eb6410cd1cb5d15f445377e2f2c592426e05cbcbc49c1"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/theseus-rs/rsql/releases/download/v0.15.2/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "ccc1ae47059d2ed83d55e91c13ac5edca99777e440b03ad8d44fa903f9e464bb"
  end
  license any_of: ["Apache-2.0", "MIT"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-pc-windows-gnu":    {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

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
    bin.install "rsql" if OS.mac? && Hardware::CPU.arm?
    bin.install "rsql" if OS.mac? && Hardware::CPU.intel?
    bin.install "rsql" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
