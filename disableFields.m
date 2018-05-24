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
set(handles.sldImages,'enable',  'off')

set(handles.txtNum, 'visible', 'off')
set(handles.txtPatient, 'visible', 'off')
set(handles.txtT2_1,'visible', 'off')
set(handles.txtT2_2,'visible', 'off')





end

