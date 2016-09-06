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

 % Add subdirs to path (and print a list)
addpath(genpath(pwd));
added = strcat({'Adding: '}, pwd, '/', cellpath(), '\n');
fprintf([added{:}]);

% Add mtools?

%% Things that depend on Preferences

if show_welcome
  session_info();
end

if startup_data
  project = load_project();
end

% if add_external && ~isempty(project)
%   add_paths(project.paths)
% end

if restore_last && ~isempty(project)
  session_restore(project.editor)
end

if tidy_up
  clear startup_data add_external show_welcome restore_last tidy_up
  clear full_path
  clear project
end
