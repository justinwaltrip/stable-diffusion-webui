{ pkgs, lib, config, inputs, ... }:

{
  packages = with pkgs; [
    wget
  ];
  languages.python = {
    enable = true;
    package = pkgs.python310;
    venv.enable = true;
  };
  env.LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc pkgs.glib pkgs.libGL ]}:/run/opengl-driver/lib";
}
