{ config, pkgs, ... }:

let
  matthew = {
    key1 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDiBSVCGJPjTnWUSjkZa6ow0hHZuJ5HOynU3Nx/b3VhdBikPa5ctcQ1nHQW662EIR3qgOxZtNl+ch2XClqIJ48WqwlfFONF/LjbDMITs5FQQBOVfxBQ62fkpjYz+26u6ZbScxGaVs/QnPxEsqey7GE+u5z5kksOmZy+2Q2LwjmkgRW1isLc9sTqegU+I50XQPaw35sUt8MO+htZeAi4MfrjZcj8xD40HMxP78D/LXPRl2TrEwRHaOA3iNfTwQklDUyNeNsCQtRGfLypMgTzAdxPAEcqaDWDxvizTtbK2EDP8kwTeITV2W4KziFZk4edM1MCzElWDzkM9GOeWa+Vf9T3 matthew@thinkpad";
    key2 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQClm+SMN9Bg1HZ+MjH1VQYEXAnslGWT9564pj/KGO79WMQLUxdp3WWa1hQadf2PleAIEFEul3knrpRSEK3yHcCk3g+sCh3XIJcFZLesswe0V+kCAw+JBSd18ESJ4Qko+iDK95cDzucLFwXB10FMVKQCrX90KR+Fp6s6eJHcZGmpxTPgNulDpAjM2APluM3xBCe6zZzt+iNIzn3J8PRKbpNNbuw/LMRU8+udrGbLavUMcSk7ER9pAyLGhz//9aHWDPu7ZRje+vTWgnGFpzbtEzdjnP+2v45nLKWG7o7WdTAsAR8WSccjtNoBiVgSmpHr07zJ0/gTeL4PUkk3lbtzF/PdtTQGm3Ng4SjOBlhRVaTuKBlF2X/Rwq+W4LCbHVgA79MyhJxL2TDbKBPUSLfckqxP89e8Q7iQ4XjIHqVb50ojNNLGcOQRrHq14Twwx/ZDDQvMXCsLwM6vyoYa8KdSaASEr1clx78qNp9PHGlr+UztW+EsoZI7j1tzcHMmq2BSK90= matthew@t480";
  };
  adrian = {
    key1 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCcEqdF/VA7+yvo0alIG1I4UwPP+1HS3BzOvAuMJ9p/mbxeOfqnYgRW+f8mYuGyVJyfLD+uSFRUrFXPXs8Y8/63woKZtu58XMd1KNAPVKDJ9yFk22Cw8i9ZPKL9MqYiR79KBRDNHbE8XbBEg8Bf5zX2rGzq/NtrrKyv2zKy2kRLE+igHQ61DxlLsBtOB3kRlZarZek1c00AGJ+FuCx8BiMj2n9o3xRgP2L1d8n0yOqfmXK87y5d7Q7CK8M+eFZozI+cqJ0ebhVoTBUMzhxdUawZ5v1p6vaI+n00aySSYneU7s5y9EXNmFz1TsCd7u16G9/rmXvcRxS5ubYn5dbnv1kVO96EdUA4VKUb9NPLsWYc0lB1WiNPbgvRCNWmmhZrCjk1mBw86VJnoOc0BVx8oGtYYmEPnV3SlZ733fArENgAvY/DhNogTLlb2WIzuBMoL6feH0q365GsOc8Jnyb3toSnP9a+hjeVnqub6Dy395e8u40MFu9s8q0wvtSQLGI77fkdK52uCpyZrUpYazeCJsLJQxQZrau1B/hhleOc3aj21nPAczNDqPJxDqgOn7+JVat6f5Xf0CjtHO4VE4ckaE1mQeQgRYtDktXb1itZ1TSIi/ZCCCjGXGvnX/aOpG4jMp4GafYWhXM3IzDg3BQKZq84xPUxKLX92K189Il7pr9gSQ==";
    key2 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDqUx2MRkIBeuDJ9h+2fo2QH+FM1T0KBsNW+WHmkQ1mQtNew0652Q/pwNHc6n3EtA/VBfnBm2jxZcYP6Mr9qnxW9ziLqwZibzWVmGLjac/0j0Z18ExMz7DVAn1mvqO7ndrcFS9rby04MYOcQIyqnpBErhxiHs3lThIZgljxZj0iYsx0s/BxRlzUjxfuqRW6kkUj4wTDmxEFQTCUzYhR96s/rJQkB+Kz34NYbF8GvZCD5iuenOjqOvsyKx/Xj7rCtmWqpx6ytI7FxwudHEptnKmng7L/Jl1U0rl3nog+ur7nQIdaoy7+oGJ/GWXtKegSFbIMjB18BYkzYAEzxh7+WLvTUxyjMjWPpaJVVW/6G4k1v8iZ0NOnwxwcRD9344RJXglGArG45+aKlEKiNm+G4Rz1L4Mxd2XbrL4nx5/+lLFrLngFecBTWHoj3v1zBKSiKTS0R7wN5YLxydo1FRUl9BbZFI3Up7VZt+l7rohqE3HeMKxN8s3d7fiZqvNOdmLoScXI7Bo+oEmXWITf5MtYQ65Yrdy+92yLomXOm/tX1+Bf7QzugEp+XHCxtz5BQs9Q/X45whH+CDwAGmltzJXgusiMBgvI1p3Xp6bvi1gB+CRqw54L7/TM465rkoYQoHyf7pu592XfDFAyZV2LmOmYbFUTqXkCrM7P/FLHfyMmbQYUuQ==";
  };
in
{
  users.users = {
    matthew = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ matthew.key1 matthew.key2 ];
      extraGroups = [ "wheel" ];
    };
    adrian = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ adrian.key1 adrian.key2 ];
      extraGroups = [ "wheel" ];
      hashedPassword = "$6$AZDUmQz/vq68y$0OZRdj45F9m.M7tpzD9X8ZuIVLSkIAQlly4a.ggHO7VZM1ZFzNFli9aEMH0FR8ANO3GESnCSrhvW5wnoCNvqP1";
    };
  };
}

