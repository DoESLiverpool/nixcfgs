{
  services.printing = {
    enable = true;
    extraConf = ''
      AllowUser doesuser
    '';
  };
  hardware.printers.ensurePrinters = [{
    name = "roland-the-vinyl-cutter";
    deviceUri = "usb://Unknown/Printer";
    model = "raw";
    description = "The DoeS Liverpool Roland Vinyl Cutter. Maintainer: Matthew Croughan";
  }]; 
}
