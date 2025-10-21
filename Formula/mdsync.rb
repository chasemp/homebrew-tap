class Mdsync < Formula
  desc "Sync between Google Docs, Confluence, and Markdown files"
  homepage "https://github.com/chasemp/mdsync"
  url "https://github.com/chasemp/mdsync/archive/refs/heads/main.zip"
  version "0.2.2"
  sha256 "5dd134ef83d20d833c0a3ea8ca488e7abe5bc64fbb921412114f96dbf5e2fa84"
  license "MIT"
  
  depends_on "python@3.11"
  
  def install
    # Install Python dependencies individually to avoid issues
    system "pip3", "install", "google-auth>=2.0.0"
    system "pip3", "install", "google-auth-oauthlib>=1.0.0"
    system "pip3", "install", "google-auth-httplib2>=0.1.0"
    system "pip3", "install", "google-api-python-client>=2.0.0"
    system "pip3", "install", "pyyaml>=6.0"
    system "pip3", "install", "python-frontmatter>=1.0.0"
    system "pip3", "install", "requests>=2.28.0"
    
    # Install the script
    bin.install "mdsync.py" => "mdsync"
    
    # Make it executable
    chmod 0755, bin/"mdsync"
  end
  
  test do
    system "#{bin}/mdsync", "--help"
  end
end
