%% Adds paths relevant to the current host

function [path] = add_paths()

project = read_project_data;
[~, currenthost] = system('hostname');

currenth = strcmp(project.paths.host, strcat(currenthost));
paths = project.paths(currenth, :);

path = struct;

for i=1:height(paths)
    [path.(paths{i, 'name'}{1})] = [paths{i, 'path'}{1} '/'];
    addpath(paths{i, 'path'}{1});
end

end