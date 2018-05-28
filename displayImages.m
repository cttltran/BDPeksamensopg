function displayImages(handles)
%DISPLAYIMAGES() The function displays images from loaded dicom files
%   Slice location and echo time for current image is presented in texts

%% Display images

% Read the position of the slider
ImagePos = round(get(handles.sldImages,'Value'));

% Show loaded images and setup texts for current image
axes(handles.axImage);
imagesc(handles.imgT2(ImagePos).Image);
axis equal off;
colormap('gray');
set(handles.txtNum,'String',...
    sprintf('%i/%i',ImagePos,length(handles.imgT2)));
set(handles.txtSlice,'String',...
    sprintf('%u',handles.imgT2(ImagePos).SliceLocation));
set(handles.txtEcho,'String',...
    sprintf('%u',handles.imgT2(ImagePos).EchoTime));

if isfield(handles,'ROIpos')
   handles.ROIpos = drawROI(handles);
   guidata(handles.btnZoom,handles);
end

if isfield(handles,'XLim')
   set(handles.axImage,'XLim',handles.XLim);
   set(handles.axImage,'YLim',handles.YLim);
end

end

