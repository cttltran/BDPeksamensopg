function handles = zoomImage(handles)
%ZOOMIMAGE() Summary of this function goes here
%   Detailed explanation goes here
if get(handles.btnZoom,'Value')
   zoom on;
else
   zoom off;
end
    handles.XLim = get(handles.axImage,'XLim');
    handles.YLim = get(handles.axImage,'YLim');
end

