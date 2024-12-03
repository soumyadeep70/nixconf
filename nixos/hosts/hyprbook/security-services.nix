{ ... }:

{
  # ┌───────────────────┐
  # │       TPM-2       │
  # └───────────────────┘
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };


  # ┌───────────────────┐
  # │      Polkit       │
  # └───────────────────┘
  security.polkit = {
    enable = true;
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (
          subject.isInGroup("users")
            && (
              action.id == "org.freedesktop.login1.reboot" ||
              action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
              action.id == "org.freedesktop.login1.power-off" ||
              action.id == "org.freedesktop.login1.power-off-multiple-sessions"
            )
          )
        {
          return polkit.Result.YES;
        }
      })
    ''
  };


  # ┌───────────────────┐
  # │       Keys        │
  # └───────────────────┘
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;


  # ┌───────────────────┐
  # │      Others       │
  # └───────────────────┘
  security.rtkit.enable = true;
}