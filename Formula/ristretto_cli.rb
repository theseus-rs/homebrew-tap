class RistrettoCli < Formula
  desc "A Java Virtual Machine (JVM) CLI."
  homepage "https://theseus-rs.github.io/ristretto/ristretto_cli/"
  version "0.12.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.12.2/ristretto_cli-aarch64-apple-darwin.tar.xz"
      sha256 "097f0566369edbbdd0712f8a32c0d60535b28340bce9a0728ecfcb4a9805816f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.12.2/ristretto_cli-x86_64-apple-darwin.tar.xz"
      sha256 "dc97f4b7efc4d24d898c0c7563a9a9472c01e00369602004aec53139dfef1fbc"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/theseus-rs/ristretto/releases/download/v0.12.2/ristretto_cli-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "10567593a084f870f331ee48cf57b86e852c7302516ef485ca295aeaf2a1fd8b"
  end
  license any_of: ["Apache-2.0", "MIT"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
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
    bin.install "java" if OS.mac? && Hardware::CPU.arm?
    bin.install "java" if OS.mac? && Hardware::CPU.intel?
    bin.install "java" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
