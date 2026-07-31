class Adm < Formula
  desc "ADM developer CLI — environment setup, GitHub integration, and AI-powered assistant"
  homepage "https://github.com/CrystalPlatforms/ADM-CLI"
  url "https://registry.npmjs.org/@crystalplatforms/adm/-/adm-0.2.3.tgz"
  sha256 "e4ca3cf620e69ecff027d7d51bbbcf2eead9aa48b44543e6ea0381b9dc72e9a2"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/adm --version")
  end
end
