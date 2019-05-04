{ modulesPath, ... }:

let
  hercules-ci-agent =
    builtins.fetchTarball "https://github.com/hercules-ci/hercules-ci-agent/archive/stable.tar.gz";
in {
  imports = [
    # Make sure to have this in all your configurations
    "${toString modulesPath}/virtualisation/google-compute-image.nix"

    (hercules-ci-agent + "/profile.nix")
  ];

  fileSystems."/".fsType = "ext4";

  services.hercules-ci-agent.clusterJoinTokenPath = "/var/keys/agent-token";
  users.extraUsers.hercules-ci-agent.extraGroups = [ "keys"  ];

  # Bake the deploy's SSH key into the image. This is not
  # kosher Nix.
  users.users.root.openssh.authorizedKeys.keyFiles = [
    (/. + builtins.getEnv("HOME") + "/.ssh/id_rsa.pub")
  ];
}
