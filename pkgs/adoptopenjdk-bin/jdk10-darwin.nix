let
  sources = builtins.fromJSON (builtins.readFile ./sources.json);
in
{
  jdk-hotspot = import ./jdk-darwin-base.nix sources.openjdk10.mac.jdk.hotspot;
  jre-hotspot = import ./jdk-darwin-base.nix sources.openjdk10.mac.jre.hotspot;
  jdk-openj9 = import ./jdk-darwin-base.nix sources.openjdk10.mac.jdk.openj9;
  jre-openj9 = import ./jdk-darwin-base.nix sources.openjdk10.mac.jre.openj9;
}
