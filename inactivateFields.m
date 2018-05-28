function handles = inactivateFields(handles)
%INACTIVATEFIELDS() Summary of this function goes here
%   Detailed explanatioff goes here

axes(handles.axImage);
cla;

set(handles.btnZoom, 'enable','off');
set(handles.btnDrawROI, 'enable','off');
set(handles.btnSaveData, 'enable','off');

set(handles.sldImages,'enable','off');

set(handles.txtNum, 'visible','off');
set(handles.txtSlice, 'visible','off');
set(handles.txtEcho, 'visible','off');
set(handles.txtPatient, 'visible','off');

axes(handles.axCurv);
cla;

set(handles.btnLoadData, 'enable','off');
set(handles.btnFitData,'enable','off');

set(handles.listMean,'String',[]);
set(handles.listEcho,'String',[]);
set(handles.listMean,'enable','off');
set(handles.listEcho,'enable','off');

set(handles.txtMean,'visible','off');
set(handles.txtT2,'visible','off');
set(handles.txtInfo,'visible','off');

end

