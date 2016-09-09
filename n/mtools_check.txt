%% Check mtools are in the path

function [status] = mtools_check()

status = isempty(regexp(path, '(mtools:)', 'match'))

end

