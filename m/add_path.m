%% Function to add path to host

function [] = add_path(newpath)

project = load_project();

% Current computer's name
[~, currenthost] = system('hostname');

% People sometimes prefer ui to add path
if nargin == 0
    newpath = uigetdir(pwd, 'What directory should be added?');
end

% And sometimes by hand
if exist(newpath, 'dir') ~= 7
    error(['This path does not exist on host ' currenthost])
end

% We don't even know whether the project struct already has any paths
try
    project.paths;
catch
    disp(['Adding path ''' newpath ''' to new host: ' currenthost]);
    project.paths = table({currenthost}, {{newpath}}, ...
        'VariableNames', {'host' 'add'});
    project.paths.host = categorical(project.paths.host);
    project.changed = datetime(clock);
    save('project.mat', 'project');
    return
end

% Check if hostname exists already; if so, add it
if any(project.paths.host == currenthost)
    
    % Verify that the path does not exist already
    row = project.paths.host == currenthost;
    pathexists = strfind(project.paths{row, 2}{1, 1}, newpath);
    pathexists = cell2mat(pathexists);
    
    if isempty(pathexists)
        pathexists = 0;
    end
    
    if ~pathexists
        disp(['Adding path ''' newpath ''' to existing host: ' currenthost]);
        project.paths{row, 2}{1, 1}(end + 1) = {newpath};
        project.changed = datetime(clock);
        save('project.mat', 'project');
    else
        disp(['Path ''' newpath ''' already added to host: ' currenthost]);
    end  

else
    
    disp(['Adding path to new host: ', currenthost]);
    project.paths(end + 1, :) = {{currenthost}, {{newpath}}};
    project.changed = datetime(clock);
    save('project.mat', 'project');

end

end