%% finish.m concept
%  http://www.mathworks.com/help/matlab/ref/finish.html

% It should:
% - remember files that where opened in the editor
% - add them to the startup.mat

% Alternatives
x = matlab.desktop.editor.getAll
x.Filename
fileNames = {x.Filename};

% Info about Matlab preferences folder - should be relevant 
% for other things as well http://stackoverflow.com/a/28588945/2416535
% %APPDATA%\MathWorks\MATLAB\R2014b\MATLAB_Editor_State.xml

%%
ES = com.mathworks.mlservices.MLEditorServices;
OpenFiles = ES.builtinGetOpenDocumentNames;
C = cell(1, numel(OpenFiles));
for i = 1:length(C)
   C{i} = char(OpenFiles(i));
end 

%%
% close your editor!!!!!
     edit unique;
     edit ismember;
% DO NOT TOUCH ANY OF THE FILES!!!!!...
     e=com.mathworks.mlservices.MLEditorServices;
     d=char(e.builtinGetOpenDocumentNames);
     disp(d);
%{
     MLROOT\toolbox\matlab\ops\unique.m 
     MLROOT\toolbox\matlab\ops\ismember.m
%}
