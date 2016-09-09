%% Create project data

function [] = initiate_project()

[~, name, ~] = fileparts(pwd);
paths = cell2table(cell(0,3), 'VariableNames', {'name', 'host', 'path'});

project = struct;

project.name = name;
project.created = datetime(clock);
project.opened = datetime(clock);
project.paths = paths;
project.editor = {};

save('startup.mat', 'project')

disp('''startup.mat'' was created in your working dir to store project-related data');

end
