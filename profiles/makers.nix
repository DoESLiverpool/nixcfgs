{ config, pkgs, ... }:
{
  users.users = {
    matthew = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIOJDRQfb1+7VK5tOe8W40iryfBWYRO6Uf1r2viDjmsJtAAAABHNzaDo= backup-yubikey"
        "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIDgsWq+G/tcr6eUQYT7+sJeBtRmOMabgFiIgIV44XNc6AAAABHNzaDo= main-yubikey"
        "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIJMi3TAuwDtIeO4MsORlBZ31HzaV5bji1fFBPcC9/tWuAAAABHNzaDo= nano-yubikey"
      ];
      extraGroups = [ "wheel" ];
    };
    adrian = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCcEqdF/VA7+yvo0alIG1I4UwPP+1HS3BzOvAuMJ9p/mbxeOfqnYgRW+f8mYuGyVJyfLD+uSFRUrFXPXs8Y8/63woKZtu58XMd1KNAPVKDJ9yFk22Cw8i9ZPKL9MqYiR79KBRDNHbE8XbBEg8Bf5zX2rGzq/NtrrKyv2zKy2kRLE+igHQ61DxlLsBtOB3kRlZarZek1c00AGJ+FuCx8BiMj2n9o3xRgP2L1d8n0yOqfmXK87y5d7Q7CK8M+eFZozI+cqJ0ebhVoTBUMzhxdUawZ5v1p6vaI+n00aySSYneU7s5y9EXNmFz1TsCd7u16G9/rmXvcRxS5ubYn5dbnv1kVO96EdUA4VKUb9NPLsWYc0lB1WiNPbgvRCNWmmhZrCjk1mBw86VJnoOc0BVx8oGtYYmEPnV3SlZ733fArENgAvY/DhNogTLlb2WIzuBMoL6feH0q365GsOc8Jnyb3toSnP9a+hjeVnqub6Dy395e8u40MFu9s8q0wvtSQLGI77fkdK52uCpyZrUpYazeCJsLJQxQZrau1B/hhleOc3aj21nPAczNDqPJxDqgOn7+JVat6f5Xf0CjtHO4VE4ckaE1mQeQgRYtDktXb1itZ1TSIi/ZCCCjGXGvnX/aOpG4jMp4GafYWhXM3IzDg3BQKZq84xPUxKLX92K189Il7pr9gSQ=="
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDqUx2MRkIBeuDJ9h+2fo2QH+FM1T0KBsNW+WHmkQ1mQtNew0652Q/pwNHc6n3EtA/VBfnBm2jxZcYP6Mr9qnxW9ziLqwZibzWVmGLjac/0j0Z18ExMz7DVAn1mvqO7ndrcFS9rby04MYOcQIyqnpBErhxiHs3lThIZgljxZj0iYsx0s/BxRlzUjxfuqRW6kkUj4wTDmxEFQTCUzYhR96s/rJQkB+Kz34NYbF8GvZCD5iuenOjqOvsyKx/Xj7rCtmWqpx6ytI7FxwudHEptnKmng7L/Jl1U0rl3nog+ur7nQIdaoy7+oGJ/GWXtKegSFbIMjB18BYkzYAEzxh7+WLvTUxyjMjWPpaJVVW/6G4k1v8iZ0NOnwxwcRD9344RJXglGArG45+aKlEKiNm+G4Rz1L4Mxd2XbrL4nx5/+lLFrLngFecBTWHoj3v1zBKSiKTS0R7wN5YLxydo1FRUl9BbZFI3Up7VZt+l7rohqE3HeMKxN8s3d7fiZqvNOdmLoScXI7Bo+oEmXWITf5MtYQ65Yrdy+92yLomXOm/tX1+Bf7QzugEp+XHCxtz5BQs9Q/X45whH+CDwAGmltzJXgusiMBgvI1p3Xp6bvi1gB+CRqw54L7/TM465rkoYQoHyf7pu592XfDFAyZV2LmOmYbFUTqXkCrM7P/FLHfyMmbQYUuQ=="
      ];
      extraGroups = [ "wheel" ];
      hashedPassword = "$6$AZDUmQz/vq68y$0OZRdj45F9m.M7tpzD9X8ZuIVLSkIAQlly4a.ggHO7VZM1ZFzNFli9aEMH0FR8ANO3GESnCSrhvW5wnoCNvqP1";
    };
  };
}

