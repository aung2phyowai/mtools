%% Create project datafile (.mat)

function [project] = read_project_data()

try
  load('project.mat');
  if ~strcmp(project.notice, 'Created by mtools')
    error('Cannot find standard ''project.mat''')
  end
  project;
  disp('Reading project file...');
catch
  project = create_project_data;
  disp('Creating new project datafile');
end

end

function [project] = create_project_data()

[~, name, ~] = fileparts(pwd);
paths = cell2table(cell(0,3), 'VariableNames', {'name', 'host', 'path'});

project = struct;
project.name = name;
project.created = datetime(clock);
project.opened = datetime(clock);
project.notice = 'Created by mtools';
project.paths = paths;

save('project.mat', 'project')

end