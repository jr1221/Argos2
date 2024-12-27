{
description = "Flutter";
inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  flake-utils.url = "github:numtide/flake-utils";
};
outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        config = {
          android_sdk.accept_license = true;
          allowUnfree = true;
        };
      };
#      buildToolsVersion = "34.0.0";
      androidComposition = pkgs.androidenv.composeAndroidPackages {
        buildToolsVersions = [ "35.0.0" "34.0.0" "33.0.1" ];
        platformVersions = [ "33" "34" "35"];
        abiVersions = [ "arm64-v8a" ];
      };
      androidSdk = androidComposition.androidsdk;
    in
    {
      devShell =
        with pkgs; mkShell rec {
          ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
          buildInputs = [
            flutter327
            androidSdk # The customized SDK that we've made above
            jdk17
	    android-studio
	    chromium
          ];
	  GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/34.0.0/aapt2";
          CHROME_EXECUTABLE = "${chromium}/bin/chromium";
        };
    });
}
