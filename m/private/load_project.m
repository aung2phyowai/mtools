%% Function to check project file

function [project] = load_project()

% Does project struct exist?
try
    load('project.mat')
    if ~strcmp(project.notice, 'Created by mtools')
        error('Error')
    end
    disp('Loading project');
    project;
catch
    disp('It seems there is no standard ''project.mat'' file in this directory');
    disp('(or it was changed in an unexpected way)')
    disp('Please run create or setup (or ''call help'' create for details)');
    error('Cannot load ''project.mat''')
end
end
