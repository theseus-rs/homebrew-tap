class RistrettoCli < Formula
  desc "A Java Virtual Machine (JVM) CLI."
  homepage "https://theseus-rs.github.io/ristretto/ristretto_cli/"
  version "0.26.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.26.0/ristretto_cli-aarch64-apple-darwin.tar.xz"
      sha256 "1eab9ee4b1d733b02b50d2bc2f5a9895a1e0d6a1dc89fca0372ad6b0b4ee37bb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.26.0/ristretto_cli-x86_64-apple-darwin.tar.xz"
      sha256 "f853d06bc74b660b87bbbe9ac6dbe014de7c6f2566861fb06c6af6c4de90b2ff"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.26.0/ristretto_cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "34e2a0729373503afb4dca14f36c055930368165d64ee257d90b2f12cd0d4ae7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.26.0/ristretto_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9655919559196153d56a01a0f8f5ee46c8a952bfca931d636d5bf5e2e4154d73"
    end
  end
  license any_of: ["Apache-2.0", "MIT"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-unknown-linux-gnu":         {},
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
    bin.install "java" if OS.linux? && Hardware::CPU.arm?
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
