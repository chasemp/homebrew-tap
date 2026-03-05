class Mdsync < Formula
  desc "Sync between Google Docs, Confluence, and Markdown files"
  homepage "https://github.com/chasemp/mdsync"
  url "https://raw.githubusercontent.com/chasemp/mdsync/f23ced54abe35950ca2432bdbdeafa10ee142c0f/mdsync.py"
  version "0.3.1"
  sha256 "cdeda8a0e0f0145e7a34aec39414d3ee4f9c9089f197e40e3c9d9651c906a29d"
  license "MIT"

  depends_on "python@3.11"

  def install
    python = Formula["python@3.11"].opt_bin/"python3.11"
    venv = libexec/"venv"

    # Create an isolated virtualenv so pip has a writable target
    system python, "-m", "venv", venv

    system "#{venv}/bin/pip", "install",
      "google-auth>=2.0.0",
      "google-auth-oauthlib>=1.0.0",
      "google-auth-httplib2>=0.1.0",
      "google-api-python-client>=2.0.0",
      "pyyaml>=6.0",
      "python-frontmatter>=1.0.0",
      "requests>=2.28.0"

    bin.install "mdsync.py" => "mdsync"

    # Point shebang at the venv Python so all deps are found
    inreplace bin/"mdsync", "#!/usr/bin/env python3.11", "#!#{venv}/bin/python3"

    chmod 0755, bin/"mdsync"
  end

  test do
    system "#{bin}/mdsync", "--help"
  end
end
