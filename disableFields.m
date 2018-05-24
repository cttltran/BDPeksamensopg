function  [ handles ] = disableFields( handles )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

set(handles.axImage, 'visible', 'off')
axes(handles.axImage);
cla;
set(handles.axCurv , 'visible', 'off')
set (handles.btnROI, 'enable', 'off')
set (handles.btnZoom, 'enable', 'off')
set (handles.btnSave, 'enable', 'off')

end

