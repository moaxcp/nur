# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> {} }:
let
  gradleGen = pkgs.callPackage ./pkgs/gradle {
      java = pkgs.jdk;
  };
in with pkgs;
rec {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  adoptopenjdk-bin-14-packages-linux = import ./pkgs/adoptopenjdk-bin/jdk14-linux.nix;
  adoptopenjdk-bin-14-packages-darwin = import ./pkgs/adoptopenjdk-bin/jdk14-darwin.nix;

  adoptopenjdk-hotspot-bin-14 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-14-packages-linux.jdk-hotspot {}
    else callPackage adoptopenjdk-bin-14-packages-darwin.jdk-hotspot {};
  adoptopenjdk-jre-hotspot-bin-14 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-14-packages-linux.jre-hotspot {}
    else callPackage adoptopenjdk-bin-14-packages-darwin.jre-hotspot {};

  adoptopenjdk-openj9-bin-14 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-14-packages-linux.jdk-openj9 {}
    else callPackage adoptopenjdk-bin-14-packages-darwin.jdk-openj9 {};

  adoptopenjdk-jre-openj9-bin-14 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-14-packages-linux.jre-openj9 {}
    else callPackage adoptopenjdk-bin-14-packages-darwin.jre-openj9 {};

  adoptopenjdk-bin-13-packages-linux = import ./pkgs/adoptopenjdk-bin/jdk13-linux.nix;
  adoptopenjdk-bin-13-packages-darwin = import ./pkgs/adoptopenjdk-bin/jdk13-darwin.nix;

  adoptopenjdk-hotspot-bin-13 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-13-packages-linux.jdk-hotspot {}
    else callPackage adoptopenjdk-bin-13-packages-darwin.jdk-hotspot {};
  adoptopenjdk-jre-hotspot-bin-13 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-13-packages-linux.jre-hotspot {}
    else callPackage adoptopenjdk-bin-13-packages-darwin.jre-hotspot {};

  adoptopenjdk-openj9-bin-13 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-13-packages-linux.jdk-openj9 {}
    else callPackage adoptopenjdk-bin-13-packages-darwin.jdk-openj9 {};

  adoptopenjdk-jre-openj9-bin-13 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-13-packages-linux.jre-openj9 {}
    else callPackage adoptopenjdk-bin-13-packages-darwin.jre-openj9 {};

  adoptopenjdk-bin-12-packages-linux = import ./pkgs/adoptopenjdk-bin/jdk12-linux.nix;
  adoptopenjdk-bin-12-packages-darwin = import ./pkgs/adoptopenjdk-bin/jdk12-darwin.nix;

  adoptopenjdk-hotspot-bin-12 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-12-packages-linux.jdk-hotspot {}
    else callPackage adoptopenjdk-bin-12-packages-darwin.jdk-hotspot {};
  adoptopenjdk-jre-hotspot-bin-12 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-12-packages-linux.jre-hotspot {}
    else callPackage adoptopenjdk-bin-12-packages-darwin.jre-hotspot {};

  adoptopenjdk-openj9-bin-12 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-12-packages-linux.jdk-openj9 {}
    else callPackage adoptopenjdk-bin-12-packages-darwin.jdk-openj9 {};

  adoptopenjdk-jre-openj9-bin-12 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-12-packages-linux.jre-openj9 {}
    else callPackage adoptopenjdk-bin-12-packages-darwin.jre-openj9 {};

  adoptopenjdk-bin-11-packages-linux = import ./pkgs/adoptopenjdk-bin/jdk11-linux.nix;
  adoptopenjdk-bin-11-packages-darwin = import ./pkgs/adoptopenjdk-bin/jdk11-darwin.nix;

  adoptopenjdk-hotspot-bin-11 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-11-packages-linux.jdk-hotspot {}
    else callPackage adoptopenjdk-bin-11-packages-darwin.jdk-hotspot {};
  adoptopenjdk-jre-hotspot-bin-11 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-11-packages-linux.jre-hotspot {}
    else callPackage adoptopenjdk-bin-11-packages-darwin.jre-hotspot {};

  adoptopenjdk-openj9-bin-11 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-11-packages-linux.jdk-openj9 {}
    else callPackage adoptopenjdk-bin-11-packages-darwin.jdk-openj9 {};

  adoptopenjdk-jre-openj9-bin-11 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-11-packages-linux.jre-openj9 {}
    else callPackage adoptopenjdk-bin-11-packages-darwin.jre-openj9 {};

  adoptopenjdk-bin-8-packages-linux = import ./pkgs/adoptopenjdk-bin/jdk8-linux.nix;
  adoptopenjdk-bin-8-packages-darwin = import ./pkgs/adoptopenjdk-bin/jdk8-darwin.nix;

  adoptopenjdk-hotspot-bin-8 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-8-packages-linux.jdk-hotspot {}
    else callPackage adoptopenjdk-bin-8-packages-darwin.jdk-hotspot {};
  adoptopenjdk-jre-hotspot-bin-8 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-8-packages-linux.jre-hotspot {}
    else callPackage adoptopenjdk-bin-8-packages-darwin.jre-hotspot {};

  adoptopenjdk-openj9-bin-8 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-8-packages-linux.jdk-openj9 {}
    else callPackage adoptopenjdk-bin-8-packages-darwin.jdk-openj9 {};

  adoptopenjdk-jre-openj9-bin-8 = if stdenv.isLinux
    then callPackage adoptopenjdk-bin-8-packages-linux.jre-openj9 {}
    else callPackage adoptopenjdk-bin-8-packages-darwin.jre-openj9 {};

  gradle-4_10_3 = gradleGen.gradle-4_10_3;
  gradle-5_6_4 = gradleGen.gradle-5_6_4;
  gradle-6_2_2 = gradleGen.gradle-6_2_2;

  micronaut-1_3_3 = callPackage ./pkgs/micronaut { };

  spring-boot-cli-2_2_5 = callPackage ./pkgs/spring-boot-cli { };
}

