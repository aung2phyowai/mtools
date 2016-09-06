%% Save editor state

function [editor] = get_editor()

% This does the job
opened = matlab.desktop.editor.getAll;
editor = {opened.Filename};

end