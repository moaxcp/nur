{ stdenv, lib, fetchzip, jdk, makeWrapper, coreutils, curl }:
let
  pname = "jbang";
in rec {
  jbangGen = {version, src} : stdenv.mkDerivation {
    inherit pname version src;

    nativeBuildInputs = [ makeWrapper ];

    installPhase = ''
      runHook preInstall
      rm bin/jbang.cmd
      rm bin/jbang.ps1
      rm -rf tmp
      cp -r . $out
      wrapProgram $out/bin/jbang \
        --set JAVA_HOME ${jdk} \
        --set PATH ${lib.makeBinPath [ coreutils jdk curl ]}
      runHook postInstall
    '';

    installCheckPhase = ''
      $out/bin/jbang --version 2>&1 | grep -q "${version}"
    '';

    meta = with lib; {
      description = "Run java as scripts anywhere";
      longDescription = ''
        jbang uses the java language to build scripts similar to groovy scripts. Dependencies are automatically
        downloaded and the java code runs.
      '';
      homepage = "https://https://www.jbang.dev/";
      license = licenses.mit;
      platforms = platforms.all;
      maintainers = with maintainers; [ moaxcp ];
    };
  };

  jbang-0_58_0 = jbangGen rec {
    version = "0.58.0";
    src = fetchzip {
      url = "https://github.com/jbangdev/jbang/releases/download/v${version}/${pname}-${version}.tar";
      sha256 = "sha256:08haij8nzzf2759ddzx0i6808g2if0v2fc21mlz00kmggjc03xz3";
    };
  };

  jbang-0_83_1 = jbangGen rec {
    version = "0.83.1";
    src = fetchzip {
      url = "https://github.com/jbangdev/jbang/releases/download/v${version}/${pname}-${version}.tar";
      sha256 = "sha256:14qs2s3rk7rbcqj36r6w1fckhl0ac7f50vwxjy67k2cci1a411nx";
    };
  };
}
