class Mdsync < Formula
  desc "Sync between Google Docs, Confluence, and Markdown files"
  homepage "https://github.com/chasemp/mdsync"
  url "https://raw.githubusercontent.com/chasemp/mdsync/89cf5a9772fd51fa5ae1b0bf079abff5dfb7fe17/mdsync.py"
  version "0.3.0"
  sha256 "00c85f51a7149a5d16565e01a064e2f5eddf799d5b94a446165d0270ece59958"
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
