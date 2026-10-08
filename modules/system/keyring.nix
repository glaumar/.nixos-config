{ ... }:

{
  # gnome-keyring provides the freedesktop Secret Service (org.freedesktop.secrets)
  # and, via gcr-ssh-agent, the SSH agent. programs.niri already sets this to
  # true; it is made explicit here because Zed/opencode credentials, SSH
  # passphrases and Electron apps all depend on it. Note: do NOT also enable
  # programs.ssh.startAgent - nixpkgs asserts it conflicts with gcr-ssh-agent.
  services.gnome.gnome-keyring.enable = true;

  # GUI to inspect/reset stored keys and passwords.
  programs.seahorse.enable = true;
}
