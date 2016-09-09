%% Function to add path to host

function [] = add_path(new_name, new_path)

%% Porject data
project = load_project();
if isempty(project)
  error('Aborting (invalid project structure)')
end

%% User input
if nargin == 0
  new_name = ['added_' get_datetime()];
  new_path = uigetdir(pwd, 'What directory should be added?');
end

if nargin == 1
  new_path = uigetdir(pwd, 'What directory should be added?');
end

if ~exist(new_path, 'dir')
    error(['''', new_path, ''' is not a valid path'])
elseif ~isempty(regexp(new_path, ['^' pwd], 'match'))
    error(['''' new_path ''' is a subdir of project dir; added when project is opened'])
end

%% Check input
[~, current_host] = system('hostname');
name_exists = strcmp(project.paths.name, new_name);
host_exists = strcmp(project.paths.host, strcat(current_host));
path_exists = strcmp(project.paths.path, new_path);

% What to update (if anything)?
upd_path = name_exists + host_exists == 2;
upd_name = path_exists + host_exists == 2;

if ~any(upd_path) && ~any(upd_name)
    
    % No such name or path on this host: create new row
    disp(['Adding new path ''' new_path ''' to host ' current_host]);
    row = table({new_name}, {strcat(current_host)}, {new_path}, ...
        'VariableNames', {'name', 'host', 'path'});
    project.paths = [project.paths; row];

elseif any(upd_path) && ~any(upd_name)
    
    % Name exists on this host: update path
    disp(['Updating path ''', new_name, ''' to ''', new_path, '''']);
    project.paths{upd_path, 'path'} = {new_path};

elseif ~any(upd_path) && any(upd_name)
    
    % Path exists on this host: update name
    disp(['Relabeling ''', new_path, ''' to ''', new_name, '''']);
    project.paths{upd_name, 'name'} = {new_name};

else
    
    % Both path and name exist on this host: do nothing
    disp(['The path ''', new_path, ''' under the name ''', new_name, ...
        ''' is already added to host ''', current_host, '''']);
end

save('startup.mat', 'project')

end
