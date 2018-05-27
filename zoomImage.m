function [handles] = zoomImage(handles)
if get(handles.btnZoom,'Value')
   zoom on;
else
   zoom off;
end
    handles.MyData.XLim = get(handles.axImage,'XLim');
    handles.MyData.YLim = get(handles.axImage,'YLim');
end

