{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    borgbackup
  ];
  
  programs.borgmatic = {
    enable = true;
    settings = {
      
    };
    backups = {
      music = {
        location = {
          sourceDirectories = [ "/home/stanisz/media/music" ];
          repositories = [ "ssh://stanisz@anton/home/stanisz/backups/public/music" ];
        };
        retention = {
          keepHourly = 1;
          keepDaily = 7;
          keepWeekly = 2;
          keepMonthly = 2;
        };
        consistency.checks = [
          {
            name = "repository";
            frequency = "2 weeks";
          }
          {
            name = "archives";
            frequency = "2 weeks";
          }
          {
            name = "data";
            frequency = "2 weeks";
          }  
        ];
      };
    };
  };

  services.borgmatic = {
    enable = true;
    frequency = "hourly";
  };
}
