function  [ handles ] = enableFields( handles )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

set(handles.axImage, 'visible', 'on')
axes(handles.axImage);
cla;
set(handles.axCurv , 'visible', 'on')
set (handles.btnROI, 'enable', 'on')
set (handles.btnZoom, 'enable', 'on')
set (handles.btnSave, 'enable', 'on')
set(handles.sldSlice,'enable',  'on');

set(handles.txtSlice, 'visible', 'on')
set(handles.txtPatient, 'visible', 'on')
set(handles.txtT2_1,'visible', 'on')
set(handles.txtT2_2,'visible', 'on')

end

