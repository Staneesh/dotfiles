{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    borgbackup
  ];
  
  programs.borgmatic = {
    enable = true;
    backups = {
      obsidian = {
        location = {
          sourceDirectories = [ "/home/stanisz/obsidian_vaults" ];
          repositories = [ "ssh://stanisz@anton/home/stanisz/backups/public/obsidian" ];
        };
        retention = {
          keepHourly = 2;
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
