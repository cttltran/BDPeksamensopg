function  [ handles ] = activateFields( handles )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

set(handles.axImage, 'visible', 'on')
axes(handles.axImage);
cla;
set(handles.axCurv , 'visible', 'on')
set (handles.btnROI, 'enable', 'on')
set (handles.btnZoom, 'enable', 'on')
set (handles.btnSave, 'enable', 'on')

end

