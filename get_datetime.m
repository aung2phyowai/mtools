%% Get date + time as a string without spaces and colons

function [datetime_str] = get_datetime()

datetime_str = datestr(datetime());
datetime_str = regexprep(datetime_str, '[: -]', '_');

end