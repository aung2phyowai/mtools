%% Add subdirectories of the pwd to the path

function [] = add_subpaths()

addpath(genpath(pwd));

fprintf('\n');
added = strcat({'Adding: '}, pwd, '/', cellpath(), '\n');
fprintf([added{:}]);

end