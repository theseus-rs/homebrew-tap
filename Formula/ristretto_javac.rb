class RistrettoJavac < Formula
  desc "A javac compatible CLI."
  homepage "https://theseus-rs.github.io/ristretto/ristretto_javac/"
  version "0.33.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.33.0/ristretto_javac-aarch64-apple-darwin.tar.xz"
      sha256 "7b988a95af56a024903ed8e288223882e310b7008a3d784f37ad6909ab8a81de"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.33.0/ristretto_javac-x86_64-apple-darwin.tar.xz"
      sha256 "9787cb663d748ce3c767206a0fc312dac20110b53f809d096d666ed63251aadc"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.33.0/ristretto_javac-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6c678e32d1470dfbc5ae13d01514fc01448caee4df4e4d70746253ae634b43c3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.33.0/ristretto_javac-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b017d39f0b6134039549fd8ff4d1ab84c0dcd2951884771eac289ec8b0ac64fd"
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "javac"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "javac"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "javac"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "javac"
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
