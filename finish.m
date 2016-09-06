%% finish.m concept
%  http://www.mathworks.com/help/matlab/ref/finish.html

%% Remember opened files (and save them to 'startup.mat')

try
  project = load_project();
  project.editor = get_editor();
  save('startup.mat', 'project');
catch
  disp('Editor state forgotten - check your ''startup.mat'' file');
end

%% More stuff on Matlab prefs

% Info about Matlab preferences folder - may be relevant:
% http://stackoverflow.com/a/28588945/2416535
% %APPDATA%\MathWorks\MATLAB\R2014b\MATLAB_Editor_State.xml
