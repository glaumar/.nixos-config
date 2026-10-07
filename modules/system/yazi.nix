{ pkgs, ... }:

{
  # yazi 及其全部预览依赖，集中在此文件管理
  environment.systemPackages = with pkgs; [
    yazi

    # 缩略图 / 预览
    ffmpegthumbnailer # 视频缩略图
    poppler-utils # PDF 缩略图（pdftoppm）
    chafa # 终端不支持图形协议时的兜底

    # 归档 / 结构化数据预览
    p7zip
    jq
    file
  ];
}
