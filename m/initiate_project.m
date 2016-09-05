%% Create project data

function [project] = initiate_project()

[~, name, ~] = fileparts(pwd);
paths = cell2table(cell(0,3), 'VariableNames', {'name', 'host', 'path'});

project = struct;
project.name = name;
project.created = datetime(clock);
project.opened = datetime(clock);
project.editor = {};
project.notice = 'Created by mtools';
project.paths = paths;

save('project.mat', 'project')

end
