{ ... }:

{

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "glaumar";
    group = "users";
    dataDir = "/home/glaumar";
  };
}

 