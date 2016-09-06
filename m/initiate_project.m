%% Create project data

function [project] = initiate_project()

[~, name, ~] = fileparts(pwd);
paths = cell2table(cell(0,3), 'VariableNames', {'name', 'host', 'path'});

project = struct;

project.name = name;
project.created = datetime(clock);
project.opened = datetime(clock);
project.paths = paths;
project.editor = {};

save('startup.mat', 'project')

end
