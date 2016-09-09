%% Save editor state

function [editor] = get_editor()

editor = matlab.desktop.editor.getAll;
editor = {editor.Filename};

end