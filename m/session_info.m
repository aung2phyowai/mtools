%% Get Matlab session info

%  Include:
%  [done] Matlab version
%  [done] Working dir
%  [done] Hostname
%  [    ] If mtools are not added, then a tip how to add them permanently
%  [    ] Toolboxes loaded
%  [    ] Other info?

function [] = session_info()

[upper_path, dir_name, ~] = fileparts(pwd);
matlab_version = version;
[~, host_name] = system('hostname');

disp(['Project ''', dir_name, ''' in ''', upper_path, '''']);
disp(['Running Matlab ', matlab_version, ' on host ', host_name]);

end