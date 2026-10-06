{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lua-language-server # lua_ls, lsp
    stylua # lua formatter

    # interpreter + package manager (lua 5.4)
    lua5_4
    lua54Packages.luarocks
  ];
}
