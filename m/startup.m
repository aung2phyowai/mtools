%% Startup file concept
%  The code in this file will run if you launch Matlab by clicking an arbitrary 
%  *.m script within a folder where this startup file is placed.

%% Preferences
startup_data = 1;             % Load project-related data from startup.mat
add_external = 1;             % Add paths as provided by startup.mat
show_welcome = 1;             % Show wd, Matlab version and host name
restore_last = 1;             % Re-open files from last session
tidy_up      = 1;             % Clear temporary variables created by this script

%% Get project path and switch to working dir (just in case)
full_path = fileparts(mfilename('fullpath'));
cd(full_path);

% Add subdirs to path
addpath(genpath(pwd));

% Get project directory name, Matlab version and hostname
[upper_path, dir_name, ~] = fileparts(pwd);
matlab_version = version;
[~, host_name] = system('hostname');

% Show welcome
if show_welcome
  disp(['Project ''', dir_name, ''' in ''', upper_path, '''']);
  disp(['Running Matlab ', matlab_version, ' on host ', host_name]);
end

%% startup_data must be a condition for all
%  each if statement must have && startup_data - otherwise things will crash...

%% Load project data (if any)
if startup_data
    
    status = exist_project();
    % 0 = exists; 1 = missing and will be created; 2 = exists but invalid
    
    if status == 0
        load('startup.mat');
    elseif status == 1
        initiate_project();
        load('startup.mat');
    elseif status == 2
        disp('Invalid ''startup.mat''; correct it or create new one by calling ''initiate_project()''');
        startup_data = 0; %to prevent error messages down the line
    end
    
end

%% Add external paths
% loop over subset of startup_mat.paths to get external paths to add

%% Reopen *.m files from last session
if startup_data && restore_last
    editor = project.editor;
    for file=editor
        if ~isempty(file)
            try
                edit(file{1});
            catch e
                disp(e)
            end
        else
            disp('No files to open from previous session');
        end
    end
end

%% Tidy-up
if tidy_up
  clear startup_data add_external show_welcome reopen_last tidy_up
  clear upper_path matlab_version host_name dir_name full_path
  clear last_opened
end
