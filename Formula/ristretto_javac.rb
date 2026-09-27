class RistrettoJavac < Formula
  desc "A javac compatible CLI."
  homepage "https://theseus-rs.github.io/ristretto/ristretto_javac/"
  version "0.34.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.34.0/ristretto_javac-aarch64-apple-darwin.tar.xz"
      sha256 "822a3fc7a9568871b8633d2346f60df2ebb44663b1f42fa28025aee7bdc5d8db"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.34.0/ristretto_javac-x86_64-apple-darwin.tar.xz"
      sha256 "dc644a648a1b01d069d5dc12df97c793e98d058cdccba1be07db5a05c9971b44"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.34.0/ristretto_javac-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "93d84f8d0cbc52dcc2706ef45df5890126bd330c2f4c80851ac06bb81874e989"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.34.0/ristretto_javac-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8663459d07ff5b44b777a48875b5dae772650148f6937a5c8ec90c0d999fbe11"
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
