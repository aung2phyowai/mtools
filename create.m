%% Create a new project

% This should
% + create new folder
% + enter it
% + copy default startup.m and finish.m into it
% + create default startup.mat
% - print something like welcome
% - check if mtools are in permanent path, if not, suggest adding it

function [] = create(name)

% Get location of mtools and the 'n' folder
[mt, ~] = fileparts(mfilename('fullpath'));
mtn = [mt '/n'];

% Fail if these cannot be found (how exactly?)

% Where should the new project be created?
loc = uigetdir(pwd, ['Where should ''' name ''' be created?']);
wd  = [loc '/' name];

if exist(wd, 'dir')
  error(['Directory ''' wd ''' already exists; to setup a project in existing directory, use setup()'])
end

% Create new dir and enter it
mkdir(wd);
cd(wd);

% Copy startup.m and finish.m to it
copyfile([mtn '/startup.txt'], [pwd '/startup.m'])
copyfile([mtn '/finish.txt'], [pwd '/finish.m'])

% Create empty startup.mat
initiate_project();
session_info();

end
