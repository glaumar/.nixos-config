{ pkgs, ... }:

let
  piper = "${pkgs.piper-tts}/bin/piper";
  aplay = "${pkgs.alsa-utils}/bin/aplay";
  sr = "22050";

  voice = base: name: onnxSha: jsonSha:
    pkgs.runCommand "piper-voice-${name}" { } ''
      mkdir -p $out
      cp ${pkgs.fetchurl {
        name = "${name}.onnx";
        url = base + name + ".onnx";
        sha256 = onnxSha;
      }} $out/${name}.onnx
      cp ${pkgs.fetchurl {
        name = "${name}.onnx.json";
        url = base + name + ".onnx.json";
        sha256 = jsonSha;
      }} $out/${name}.onnx.json
    '';

  voices = {
    piper-zh = {
      lang = "zh";
      voice = "zh_CN-huayan-medium";
      modelDir = voice "https://huggingface.co/rhasspy/piper-voices/resolve/main/zh/zh_CN/huayan/medium/" "zh_CN-huayan-medium" "sha256-mSmRe/jKuyb9Uo6kTTpmmcEehzF6FHZTEkIL4jC+Dz0=" "sha256-1SHcRVBKjMyZ4yWCKzWUbdcBhAv7B+PbsxpAkp7WqCs=";
    };
    piper-en = {
      lang = "en";
      voice = "en_US-ryan-medium";
      modelDir = voice "https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_US/ryan/medium/" "en_US-ryan-medium" "sha256-q/TCdIYlZO1ke6DSxH+O58m3F9J72tkhkQDrMQ20BHo=" "sha256-RANMBWyxVoGyrUlDB8fz8uRJnRJTxwDHEfoKRgf/540=";
    };
    piper-ko = {
      lang = "ko";
      voice = "ko_KR-kss-medium";
      modelDir = voice "https://huggingface.co/rhasspy/piper-voices/resolve/main/ko/ko_KR/kss/medium/" "ko_KR-kss-medium" "sha256-Yk/XdOJolfJL664b2aM3njOUuureS1hJJPg+QUCW4sk=" "sha256-FTtWGdBYD4JKWRCNg8oZQ03kEOuOT+gDJbWGhP3Iod8=";
    };
    piper-ja = {
      lang = "ja";
      voice = "ja_JA-hi_fi_captain-medium";
      modelDir = voice "https://huggingface.co/rhasspy/piper-voices/resolve/main/ja/ja_JA/hi_fi_captain/medium/" "ja_JA-hi_fi_captain-medium" "sha256-Xq+hYQ/HoP8uf96cvgly2HYmbiPY2zMXJ+skZvGUYOs=" "sha256-VC6wtjic2JygKuZicA4d7Enr8bYSghxO0uHRyk4NJXw=";
    };
  };
in
{
  services.speechd.enable = true;

  services.speechd.config = ''
    AddModule "espeak-ng" "sd_espeak-ng" "espeak-ng.conf"
    AddModule "piper-zh" "sd_generic" "piper-zh.conf"
    AddModule "piper-en" "sd_generic" "piper-en.conf"
    AddModule "piper-ko" "sd_generic" "piper-ko.conf"
    AddModule "piper-ja" "sd_generic" "piper-ja.conf"
    DefaultModule "espeak-ng"
    LanguageDefaultModule "zh" "piper-zh"
    LanguageDefaultModule "en" "piper-en"
    LanguageDefaultModule "ko" "piper-ko"
    LanguageDefaultModule "ja" "piper-ja"
  '';

  services.speechd.modules =
    {
      "espeak-ng" = builtins.readFile "${pkgs.speechd}/etc/speech-dispatcher/modules/espeak-ng.conf";
    }
    // builtins.mapAttrs (name: v: ''
         AddVoice "${v.lang}" "male1" "Piper"
         GenericDefaultCharset "utf-8"
         GenericExecuteSynth "echo '$DATA' | ${piper} -m ${v.modelDir}/${v.voice}.onnx -s 0 --output-raw | ${aplay} -q -t raw -c 1 -r ${sr} -f S16_LE"
         GenericRateAdd 1
         GenericPitchAdd 1
         GenericVolumeAdd 1
         GenericRateMultiply 1
         GenericPitchMultiply 1000
       '')
      voices;

  environment.systemPackages = with pkgs; [
    piper-tts
    alsa-utils
    espeak-ng
  ];
}