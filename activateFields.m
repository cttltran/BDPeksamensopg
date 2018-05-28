function handles = activateFields(handles)
%ACTIVATEFIELDS() The function activates fields on GUI images is loaded
%   Detailed explanation goes here

axes(handles.axImage);

set(handles.btnZoom, 'enable','on');
set(handles.btnDrawROI, 'enable','on');
set(handles.btnSaveData, 'enable','on');

set(handles.sldImages,'enable','on');

set(handles.txtNum, 'visible','on');
set(handles.txtSlice, 'visible','on');
set(handles.txtEcho, 'visible','on');
set(handles.txtPatient, 'visible','on');

end

