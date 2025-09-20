{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # hardware info
    cpu-x
    gpu-viewer
    hw-probe
    lm_sensors

    # stress testing
    speedtest
    s-tui
    furmark
    unigine-superposition
  ];

  programs.coolercontrol.enable = true;
}
