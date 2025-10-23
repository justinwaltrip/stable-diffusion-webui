{ pkgs, lib, config, inputs, ... }:

{
  packages = with pkgs; [
    wget
    libGL
  ];
  languages.python = {
    enable = true;
    package = pkgs.python310;
  };
  env.LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ]}:/run/opengl-driver/lib";
}
