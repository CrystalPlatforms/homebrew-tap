class Adm < Formula
  desc "ADM developer CLI — environment setup, GitHub integration, and AI-powered assistant"
  homepage "https://github.com/CrystalGamesStudio/ADM-CLI"
  url "https://registry.npmjs.org/@crystalgames/adm/-/adm-0.1.8.tgz"
  sha256 "4b59d893f5e682262191e8acd414502edd5818fba514bc344b2ba02c2b3324f8"
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
