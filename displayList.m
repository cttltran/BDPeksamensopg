function displayList(handles)
%DISPLAYLIST() Summary of this function goes here
%   Detailed explanation goes here
a = get(handles.txtMean,'String');
str_mean = a;
b = char(get(handles.listMean,'String'));
old_mean = b;
c = char(old_mean,str_mean);
new_mean = c;
set(handles.listMean,'String',cellstr(new_mean));

d = get(handles.txtEcho,'String');
str_echo = d;
e = char(get(handles.listEcho,'String'));
old_echo = e;
f = char(old_echo,str_echo);
new_echo = f;
set(handles.listEcho,'String',cellstr(new_echo));
end

