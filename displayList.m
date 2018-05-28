function displayList(handles)
%DISPLAYLIST() The function displays mean values and echo times in seperate
%listboxes for later use in analyze data
%   

% Mean values in listbox for mean values
a = get(handles.txtMean,'String');
str_mean = a;
b = char(get(handles.listMean,'String'));
old_mean = b;
c = char(old_mean,str_mean);
new_mean = c;
set(handles.listMean,'String',cellstr(new_mean));

% Echo times in listbox for echo times
d = get(handles.txtEcho,'String');
str_echo = d;
e = char(get(handles.listEcho,'String'));
old_echo = e;
f = char(old_echo,str_echo);
new_echo = f;
set(handles.listEcho,'String',cellstr(new_echo));

% When data is loaded to the listboxes, enable fit data
set(handles.btnFitData,'enable','on');

end

