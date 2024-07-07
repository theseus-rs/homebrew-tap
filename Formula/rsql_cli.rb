class RsqlCli < Formula
  desc "rsql is a CLI for DuckDB, LibSQL, MariaDB, MySQL, PostgreSQL, SQLite3 and SQL Server."
  homepage "https://github.com/theseus-rs/rsql"
  version "0.13.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.13.4/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "36b3e9604fdb1e791d9aa77adb9150c367f507e3ce8e03883f25af1c351fb443"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.13.4/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "b73f1adc0345eea8de33626a456312a213cfd4efa128e02db2900bbffb5932ec"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.13.4/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a3ea1e710fa605185ccf7f40e850f7df78fb5aa56d68afffaab9e73c4e0269e9"
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
