class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.1.2"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.2/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "894cb7f52e7828eafd19c711d3528732cdd6d3080806b83f9f4ef226c3c40ae1"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.2/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "8088bc531ae247bc5a24b0f78093098abce46c732df00fa6a01e03be3016029f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.2/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9675970551bcdaf578b0a9f36304c4f24171c29ee266eb6282d8263f6a2d578e"
    end
  end
  license "Apache-2.0 OR MIT"

  def install
    on_macos do
      on_arm do
        bin.install "rsql"
      end
    end
    on_macos do
      on_intel do
        bin.install "rsql"
      end
    end
    on_linux do
      on_intel do
        bin.install "rsql"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
