class RistrettoJavac < Formula
  desc "A javac compatible CLI."
  homepage "https://theseus-rs.github.io/ristretto/ristretto_javac/"
  version "0.35.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.35.0/ristretto_javac-aarch64-apple-darwin.tar.xz"
      sha256 "abfbbb44d4dd05a55ed51267d65ebb55db79f1bac016e0d74b5bf3f0353f15de"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.35.0/ristretto_javac-x86_64-apple-darwin.tar.xz"
      sha256 "f5425c9471c784d37b357f4291920190fd3d5ccea910d131ec4dc4cbb0481b4c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.35.0/ristretto_javac-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d1382481fc89ee8be72f33392963d1d85931bf6cf17959afaff49b28f495a74a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.35.0/ristretto_javac-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "29edac3b5676549fd65fc435776460ae51c406f1886577deebb7b338e54316ba"
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
