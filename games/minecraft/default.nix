{ pkgs, ... }:

# TODO add whitelist of just friends
{
  services.minecraft-server = {
    enable = false;
    eula = true;

    openFirewall = true;

    package =
      let
        version = "1.16.1";
        url = "https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar";
        sha256 = "2782d547724bc3ffc0ef6e97b2790e75c1df89241f9d4645b58c706f5e6c935b";
      in pkgs.minecraft-server.overrideAttrs (old: rec {
        pname = "minecraft-server";
        inherit version;

        src = pkgs.fetchurl {
          inherit url sha256;
        };
      });

    # so we can configure server properties
    declarative = true;

    serverProperties = {
      pvp = false;
      max-players = 5;
      motd = "chessai's Minecraft server";
    };

    ops = [
      {
        uuid = "2698c115-1845-45ec-a1f2-4ebc4e8a5d29";
        name = "chessai";
        level = 4;
      }
    ];

    jvmOpts = "-Xmx10240M -Xms8192M ";
  };
}
