{configs,pkgs,inputs,...}:{
  services = {
    qemuGuest.enable = true;
    xserver.enable = true;
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;
    spice-webdavd.enable = true;
  };
}
