function handles = activateFields(handles)
%ACTIVATEFIELDS() Summary of this function goes here
%   Detailed explanation goes here

set(handles.axImage, 'visible','on');

set(handles.btnZoom, 'enable','on');
set(handles.btnDrawROI, 'enable','on');
set(handles.btnSaveData, 'enable','on');

set(handles.sldImages,'enable','on');

set(handles.txtNum, 'visible','on');
set(handles.txtSlice, 'visible','on');
set(handles.txtEcho, 'visible','on');
set(handles.txtPatient, 'visible','on');

end

