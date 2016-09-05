%% finish.m concept
%  http://www.mathworks.com/help/matlab/ref/finish.html

%% Remember opened files
% - when closing Matlab, make a list of opened scripts
% - save it in the startup.mat (so it can be recovered by startup.m)

% This does the job
opened = matlab.desktop.editor.getAll;
last_opened = {opened.Filename};

% this needs to be replaced so it puts the files to the startup.mat
save('last_opened.mat', 'last_opened')

%% More stuff on Matlab prefs

% Info about Matlab preferences folder - should be relevant 
% for other things as well http://stackoverflow.com/a/28588945/2416535
% %APPDATA%\MathWorks\MATLAB\R2014b\MATLAB_Editor_State.xml
