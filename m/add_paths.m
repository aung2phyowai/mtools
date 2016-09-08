%% Adds paths relevant to the current host

function [paths] = add_paths(paths)

% Subset: only those paths that belong to current host
[~, current_host] = system('hostname');
current_host = strcmp(paths.host, strcat(current_host));
current_paths = paths(current_host, :);

% If a path is successfully added, make it also available in the Workspace
paths = struct;
fprintf('\n');

for i=1:height(current_paths)
  
  try
    addpath(current_paths{i, 'path'}{1});
    [paths.(current_paths{i, 'name'}{1})] = [current_paths{i, 'path'}{1} '/'];
    disp(['Adding ''' current_paths{i, 'name'}{1} ''': ' current_paths{i, 'path'}{1}]);
  
  catch e
    fprintf('\n');
    disp(e);
  
  end    

end

end