{ pkgs, config, lib, ... }:

{
  systemd.services.cloudflared-doh = {
    enable = true;
    description = "DNS over HTTPS (DoH) proxy client";
    wants = [ "network-online.target" "nss-lookup.target" ];
    before = [ "nss-lookup.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      AmbientCapabilities = "CAP_NET_BIND_SERVICE";
      CapabilityBoundingSet = "CAP_NET_BIND_SERVICE";
      DynamicUser = "yes";
      ExecStart = "${pkgs.cloudflared}/bin/cloudflared proxy-dns";
    };
  };
}
