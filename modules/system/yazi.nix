{ pkgs, ... }:

{
  # yazi and all its preview dependencies, managed centrally in this file
  environment.systemPackages = with pkgs; [
    yazi

    # Thumbnails / preview
    ffmpegthumbnailer # video thumbnails
    poppler-utils # PDF thumbnails (pdftoppm)
    chafa # fallback when the terminal lacks graphics-protocol support

    # Archive / structured data preview
    p7zip
    jq
    file
  ];
}
