%% Function to add path to host

function [project] = add_path(newname, newpath)

if nargin < 2
  newpath = uigetdir(pwd, 'What directory should be added?');
end

if nargin < 1
  newname = 'somepath';
  newpath = uigetdir(pwd, 'What directory should be added?');
end

if ~exist(newpath, 'dir')
    error(['''', newpath, ''' is not a valid path'])
elseif ~isempty(regexp(newpath, ['^' pwd], 'match'))
    error(['''', newpath, ...
        ''' is a subdirectory of project folder, therefore added when project is opened'])
end

project = read_project_data;
[~, currenthost] = system('hostname');

% Check input
name_exists = strcmp(project.paths.name, newname);
host_exists = strcmp(project.paths.host, strcat(currenthost));
path_exists = strcmp(project.paths.path, newpath);

% Decide what to update
upd_path = name_exists + host_exists == 2;
upd_name = path_exists + host_exists == 2;

if ~any(upd_path) && ~any(upd_name)
    
    % No such name or path on this host: create new row
    disp(['Adding new path ''', newpath, ''' to host ''' , currenthost, '''']);
    row = table({newname}, {strcat(currenthost)}, {newpath}, ...
        'VariableNames', {'name', 'host', 'path'});
    project.paths = [project.paths; row];

elseif any(upd_path) && ~any(upd_name)
    
    % Name exists on this host: update path
    disp(['Updating path ''', pathname, ''' to ''', newpath, '''']);
    project.paths{upd_path, 'path'} = {newpath};

elseif ~any(upd_path) && any(upd_name)
    
    % Path exists on this host: update name
    disp(['Renaming ''', newpath, ''' to ''', newname, '''']);
    project.paths{upd_name, 'name'} = {newname};

else
    
    % Path, name both exist on this host: do nothing
    disp(['The path ''', newpath, ''' under the name ''', newname, ...
        ''' is already added to host ''', currenthost, '''']);
end

save('project.mat', 'project')

end