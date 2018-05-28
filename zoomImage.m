function handles = zoomImage(handles)
%ZOOMIMAGE() The function makes it possible to zoom on the image
%   The coordinates are saved for use in drawROI function

% Setup zoom info to user
set(handles.txtInfo, 'visible','on');
zoom_Info = sprintf('Click and drag the mouse on the image to zoom.\nRight-click on the image to zoom out or reset view.');
set(handles.txtInfo,'String',zoom_Info);

% Get and save coordinates for zoom
if get(handles.btnZoom,'Value')
   zoom on;
else
   zoom off;
end
    handles.XLim = get(handles.axImage,'XLim');
    handles.YLim = get(handles.axImage,'YLim');
end

