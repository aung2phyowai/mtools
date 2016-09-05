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
