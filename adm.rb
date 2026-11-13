class Adm < Formula
  desc "ADM — lightweight, multi-platform developer environment installer"
  homepage "https://github.com/CrystalPlatforms/ADM-CLI"
  version "0.4.0"
  license "MIT"

  # Portable bundles: each ships ADM (app/) and a private Node runtime,
  # so no system Node dependency is needed.
  on_arm do
    url "https://github.com/CrystalPlatforms/ADM-CLI/releases/download/v#{version}/adm-v#{version}-darwin-arm64.tar.gz"
    sha256 "81aaf09a62e3227dea8a08fb35b74b939bc68cea61f322c00f23d34aece991c2"
  end
  on_intel do
    url "https://github.com/CrystalPlatforms/ADM-CLI/releases/download/v#{version}/adm-v#{version}-darwin-x64.tar.gz"
    sha256 "39d85c821884c40b89bc6d80f25aa0baaf67353abed5b07c023a7a6eb9c3ddf1"
  end

  def install
    # Install the whole portable bundle (app + private Node runtime).
    libexec.install Dir["*"]
    # Wrapper that runs adm under the bundled private Node.
    (bin/"adm").write <<~EOS
      #!/bin/sh
      exec "#{libexec}/runtime/bin/node" "#{libexec}/app/bin/adm" "$@"
    EOS
  end

  def caveats
    <<~EOS
      ADM ships its own Node runtime — no system Node is required.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/adm -v")
  end
end
