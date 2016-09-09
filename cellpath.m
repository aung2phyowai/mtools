%% Return genpath as list

function [subdirs] = cellpath(hidden)

if nargin == 0
  hidden = 0;
end

subdirs = regexp(genpath(pwd), pwd, 'split')';
subdirs = regexprep(subdirs, '(:$|^/)', '');    %remove trailing : and leading /

if ~hidden
  subdirs = regexprep(subdirs, '^[\\.].+', '');
end

subdirs = subdirs(~strcmp(subdirs, ''));

end