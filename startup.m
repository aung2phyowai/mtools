%% Startup file concept
%  The code in this file will run if you launch Matlab by clicking an arbitrary
%  *.m script within a folder where this startup file is placed.

%% Preferences
startup_data = 1;             % Load project-related data from startup.mat
add_external = 1;             % Add paths as provided by startup.mat
add_local    = 1;             % Add subdirectories of the project dir to path
show_welcome = 1;             % Show wd, Matlab version and host name
restore_last = 1;             % Re-open files from last session
tidy_up      = 1;             % Clear temporary variables created by this script

%% Get project path and switch to working dir (just in case)
full_path = fileparts(mfilename('fullpath'));
cd(full_path);

% Add mtools?
addpath('m');

%% Things that depend on Preferences

if show_welcome
  session_info();
end

if startup_data
  project = load_project();
end

if add_external && ~isempty(project)
  fprintf('\n');
  paths = add_paths(project.paths);
end

if add_local
  fprintf('\n');
  addpath(genpath(pwd));
  added = strcat({'Adding: '}, pwd, '/', cellpath(), '\n');
  fprintf([added{:}]);
end

if restore_last && ~isempty(project)
  fprintf('\n');
  session_restore(project.editor)
end

if tidy_up
  clear startup_data add_external add_local show_welcome restore_last tidy_up
  clear full_path
  clear added project
end
