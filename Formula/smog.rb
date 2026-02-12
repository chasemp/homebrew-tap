class Smog < Formula
  desc "Airtable employee lookup client"
  homepage "https://github.com/chasemp/smog"
  url "https://github.com/chasemp/smog/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "ee99353bee49adf3cd74aaa539cfb2c2a2f1d98015dfddbf4c7cf36906cfb087"

  depends_on "python@3.9"

  def install
    # Create a virtualenv
    venv = virtualenv_create(libexec, "python3.9")

    # Install the package and its dependencies
    system libexec/"bin/pip", "install", "."

    # Link the executable
    bin.install_symlink libexec/"bin/smog"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/smog --help")
  end
end
