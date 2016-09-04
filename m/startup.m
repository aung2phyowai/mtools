%% Startup file concept
%  The code in this file will run if you launch Matlab by clicking an arbitrary 
%  *.m script within a folder where this startup file is placed.

%% Initialize variables

startup_data = 1;               % Load project-related data from startup.mat
add_external = 1;               % Add paths as provided by startup.mat
show_welcome = 1;               % Show pwd, Matlab version and host name

%% Get project path, Matlab version and hostname

full_path = fileparts(mfilename('fullpath'));
matlab_version = version;
[~, host_name] = system('hostname');

%% Switch to working dir (just in case) and add subdirs to path

cd(full_path);
addpath(genpath(pwd));

%% Get project directory name

[upper_path, dir_name, ~] = fileparts(pwd);

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
