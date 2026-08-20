{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    (mpv.override {
      scripts = [
        mpvScripts.mpris
        mpvScripts.uosc
        mpvScripts.thumbfast
      ];
    })
    anime4k
  ];

  # https://github.com/bloc97/Anime4K
  environment.etc."mpv/shaders/Anime4K".source = "${pkgs.anime4k}";
  environment.etc."mpv/mpv.conf".text = ''
    # Anime4K
    glsl-shaders="~~/shaders/Anime4K/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K/Anime4K_Restore_CNN_VL.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_M.glsl"
    
    # uosc
    # uosc provides seeking & volume indicators (via flash-timeline and flash-volume commands)
    # if you decide to use them, you don't need osd-bar
    osd-bar=no

    # uosc will draw its own window controls and border if you disable window border
    border=no
  '';
  
  environment.etc."mpv/input.conf".text = ''
    # Anime4K
    CTRL+0 no-osd change-list glsl-shaders clr ""; show-text "GLSL shaders cleared"
    CTRL+1 no-osd change-list glsl-shaders set "~~/shaders/Anime4K/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K/Anime4K_Restore_CNN_VL.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode A (HQ)"
  '';

}