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

  gradle-4_10_3 = gradleGen.gradle-4_10_3;
  gradle-5_6_4 = gradleGen.gradle-5_6_4;
  gradle-6_2_2 = gradleGen.gradle-6_2_2;

  micronaut-1_3_3 = pkgs.callPackage ./pkgs/micronaut { };

  spring-boot-cli-2_2_5 = pkgs.callPackage ./pkgs/spring-boot-cli { };
}

