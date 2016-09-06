%% Does project data-file created by mtools exist?
%  status
%  0    exists, can be loaded
%  1    does not exist, needs to be created
%  2    exists but invalid, will not be created

function [status] = exist_project()

% Is there 'startup.mat' ?
try
    load('startup.mat');
catch
    disp('Cannot find ''startup.mat''')
    status = 1;
    return
end

% For now, check the validity of 'startup.mat' by testing class == struct
% and fieldnames; but a proper class constructor is needed in the future
expected_fields = {'name'; 'created'; 'opened'; 'paths'; 'editor'};

% If 'startup.mat' exists, is it a struct with fields?
try
    loaded_fields = fieldnames(project);
catch
    disp('The file ''startup.mat'' is not a valid project structure');
    status = 2;
    return
end

% If so, do the fields have correct names?
equal_length = length(loaded_fields) == length(expected_fields);
equal_names  = all(strcmp(loaded_fields, expected_fields));

if  equal_length && equal_names
    disp('Found valid ''startup.mat''');
    status = 0;
else
    msg = ['Found startup.mat but with incompatible fields\n\n' ...
        'Should have:\n' strjoin(expected_fields, ', ') ...
        '\n\nbut has:\n' strjoin(loaded_fields, ', ') ...
        '\n'];
    fprintf(msg);
    status = 2;
end

end