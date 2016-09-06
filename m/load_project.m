%% Load project (if present)

%  Load project data

function [project] = load_project()

  status = exist_project();
  % 0 = exists; 1 = missing and will be created; 2 = exists but invalid
  
  if status == 0
    load('startup.mat');
  
  elseif status == 1
    initiate_project();
    load('startup.mat');
  
  elseif status == 2
    project = {};
  
  end

end