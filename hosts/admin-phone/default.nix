{ pkgs, ... }:
{
  device = "dreamlte";
  flavor = "lineageos";
  androidVersion = 12;
  buildDateTime = 1667856428;
  apps = {
    fdroid.enable = true;
  };
  vendor.extraConfig = ''
    include vendor/gapps/arm64/arm64-vendor.mk
  '';
  source.dirs."vendor/gapps".src = pkgs.fetchgit {
    rev = "d547c376983cc644b5a6b4e7ed1fd59984f5569c";
    url = "https://gitlab.com/MindTheGapps/vendor_gapps.git";
    sha256 = "sha256-SkAsHteEcveqIjDnB55s4rTVefrOTlzIW1nTOGh0448=";
  };
  source.dirs."device/samsung/dreamlte".src = pkgs.fetchgit {
    rev = "f885b96f68f7c9579134a316206e3a556a3f870a";
    url = "https://github.com/8890q/android_device_samsung_dreamlte.git";
    sha256 = "sha256-M1kEgnfI0xn1vVjeAKXii+CnQelpE/S4LaL63++em1g=";
  };

  source.dirs."device/samsung/universal8895-common".src = pkgs.fetchgit {
    rev = "267d670aac1f6b02161d3ff164f411827e4ee68c";
    url = "https://github.com/8890q/android_device_samsung_universal8895-common.git";
    sha256 = "sha256-1AfV/EZBJXKYUOGodOqOF0MQhGynGpsy3ATyylKSuiM=";
  };

  source.dirs."kernel/samsung/universal8895".src = pkgs.fetchgit {
    rev = "d45ecc236a98c10f28d7a0cad5238379634366af";
    url = "https://github.com/8890q/android_kernel_samsung_universal8895.git";
    sha256 = "sha256-fwkQ9aKjK34go+u9ldxUBfCYyXZUl9uFc2uq6h9NcTI=";
  };

  source.dirs."vendor/samsung".src = pkgs.fetchgit {
    rev = "64dc02b8f0f12ca3abff2b2674a09c8e57559f7d";
    url = "https://github.com/8890q/proprietary_vendor_samsung.git";
    sha256 = "sha256-xmof6lFeD75amubfYiExgKAYq296LadGerI3Uu2fhLw=";
  };

  source.dirs."hardware/samsung".src = pkgs.fetchgit {
    rev = "ee54c6737f5274e8af52de8c11544c97fdeef296";
    url = "https://github.com/8890q/android_hardware_samsung.git";
    sha256 = "sha256-XnHxAIi5/gDO5h+STAiiwdjltBh1nExmSEqcMLRhh58=";
  };

  source.dirs."device/samsung_slsi/sepolicy".src = pkgs.fetchgit {
    rev = "a03fb392d93f42d99d3f43303954ac27949936d2";
    url = "https://github.com/LineageOS/android_device_samsung_slsi_sepolicy.git";
    sha256 = "sha256-ccpFjGb7f4alK6+cuTC91xqB8jRNZwX8OeZYz3Z0dng=";
  };
}
