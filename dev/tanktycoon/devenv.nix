{ ... }:

{
  languages.dart.enable = true;
  android = {
    enable = true;
    flutter.enable = true;
    buildTools.version = [ "34.0.0" ];
    platforms.version = [
      "32"
      "34"
      "35"
    ];
    ndk = {
      enable = true;
      version = [ "26.3.11579264" ];
    };
    extraLicenses = [
      "android-sdk-preview-license"
      "android-googletv-license"
      "android-googlexr-license"
      "android-sdk-arm-dbt-license"
      "google-gdk-license"
      "intel-android-extra-license"
      "intel-android-sysimage-license"
      "mips-android-sysimage-license"
    ];
  };

  env = {
    CHROME_EXECUTABLE = "/snap/bin/brave";
  };

  enterShell = ''
    echo ""
    echo -e "\033[1;32m✔ Development shell activated successfully\033[0m"
    echo ""
  '';
}
