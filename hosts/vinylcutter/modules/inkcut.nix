{
  home-manager.users.doesuser = {
    xdg.configFile."inkcut/inkcut.device.json" = {
      source = ./inkcut.device.json;
      force = true;
    };
  };
}
