%% Startup file concept
%  The code in this file will run if you launch Matlab by clicking an arbitrary 
%  *.m script within a folder where this startup file is placed.

%% Preferences
startup_data = 1;               % Load project-related data from startup.mat
add_external = 1;               % Add paths as provided by startup.mat
show_welcome = 1;               % Show pwd, Matlab version and host name
restore_last = 1;               % Re-opens files from last session
tidy_up      = 1;               % Clear temporary variables

%% Get project path and switch to working dir (just in case)
full_path = fileparts(mfilename('fullpath'));
cd(full_path);

%% Add subdirs to path
addpath(genpath(pwd));

%% Get project directory name, Matlab version and hostname
[upper_path, dir_name, ~] = fileparts(pwd);
matlab_version = version;
[~, host_name] = system('hostname');

%% startup_data must be a condition for all
%  each if statement must have && startup_data - otherwise things will crash...

%% Show welcome
if show_welcome
  disp(['Project ''', dir_name, ''' in ''', upper_path, '''']);
  disp(['Running Matlab ', matlab_version, ' on host ', host_name]);
end

%% Load project data (if any)
% if startup_data
%   try
%     startup_mat = load('startup.mat');
%     try
%       strcmp(startup_mat.notice, 'Created by mtools');
%     catch
%       msg = ['''startup.mat'' is a speacial project structure; ' ...
%         'if you want to use it, please remove/rename other files named ' ...
%         '''startup.mat'' from your project folder'];
%       disp(msg);
%     end
%   catch
%     disp('Creating new ''startup.mat'' file to store project-related info');
%     create_startup_mat
%     startup_mat = load('startup.mat');
%   end
% end

%% Add external paths
% loop over subset of startup_mat.paths to get external paths to add

%% Reopen tabs
%  Empty or non-empty last_opened cell will be present in the startup.mat file
%  For now, we load it from local .mat object
load('last_opened.mat');
if restore_last
  for file=last_opened
    try
      edit(file{1});
    end
  end
end

%% Tidy-up
if tidy_up
  clear startup_data add_external show_welcome reopen_last tidy_up
  clear upper_path matlab_version host_name dir_name full_path
  clear last_opened
end
