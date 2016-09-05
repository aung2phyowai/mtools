%% Does project data-file created by mtools exist?

function [status] = exist_project()

try
  load('startup.mat');
  if ~strcmp(project.notice, 'Created by mtools')
    error('Cannot find ''startup.mat'' created by mtools')
  end
  status = 1;
  disp('Reading project file...');
catch e
  disp(e);
  status = 0;
end

end