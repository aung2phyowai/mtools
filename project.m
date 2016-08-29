%% A project file

%% Set pwd to here
projectwd = fileparts(mfilename('fullpath'));
projectname = projectwd(regexp(projectwd, '[^\\]+$'):end);
cd projectwd

%%  Add subdirectories
addpath(genpath(projectwd));

%% Add external paths and run other commands

% Adaptivni cesty:
% Cesty k externim slozkam (typicky toolboxy) mohou byt ruzne na ruznych
% pocitacich (napr. Windows vs linux apod.).
%
% use_path()
% Zjisti nazev pocitace a prida cestu do sloupce s timto nazvem. Struktura
% s vecmi jako jsou cesty je ulozena pod nazvem project.mat nebo tak neco.
%
% add_paths()
% Zjisti nazev pocitace a sahne do spravneho sloupce pro seznam cest.

%% Create mockup project struct
clear project
project.name = projectname;
project.created = datetime(clock);
project.changed = datetime(clock);
project.notice = 'Created by mtools';

host = {'some-host' 'another-host'};
add = {{'some-host/path1' 'some-host/path2'} {{'another-host/path1'}}};

paths = table(host', add', 'VariableNames', {'host' 'add'});
paths.host = categorical(paths.host);

project.paths = paths;
clear host add paths

save('project.mat', 'project')
%load('project.mat')
%%

% % Current computer's name
% [~, currenthost] = system('hostname');
% 
% % New path to add
% newpath = strcat(currenthost, '/', 'another/path');
% 
% % Check if hostname exists already; if so, add it
% if any(project.paths.host == currenthost)
%     
%     % Verify that the path does not exist already
%     row = project.paths.host == currenthost;
%     pathexists = strfind(project.paths{row, 2}{1, 1}, newpath);
%     pathexists = cell2mat(pathexists);
%     
%     if ~pathexists
%         disp(['Adding element to existing host: ' currenthost]);
%         project.paths{row, 2}{1, 1}(end + 1) = {newpath};
%     else
%         disp(['Path ' newpath ' already added to host ' currenthost]);
%     end  
% 
% else
%     
%     disp(['Adding path to new host: ', currenthost]);
%     project.paths(end + 1, :) = {{currenthost}, {{newpath}}};
% 
% end
