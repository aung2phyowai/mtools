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
    disp('Invalid ''startup.mat''; correct it or create new one by calling ''initiate_project()''');
  
  end

end