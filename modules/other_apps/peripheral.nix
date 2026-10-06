{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  environment.systemPackages = with pkgs; [
    piper
    webcamoid

    # NOTE:
    # fix via error: "NotAllowedError: Failed to open the device"
    # sudo chmod a+rw /dev/hidraw*
    # via
  ];

}
