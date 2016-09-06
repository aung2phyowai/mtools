%% Restore opened files from last session

function [] = session_restore(editor)

if isempty(editor)
  disp('No files to open from previous session');
  return
end

for file=editor
  try
    edit(file{1});
  catch e
    disp(e);
  end
end

end