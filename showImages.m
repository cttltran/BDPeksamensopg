function showImages(handles)
%SHOWIMAGES The function displays images from loaded dicom files
%   The function also gives the opportunity to edit contrast

% Read the position of the slider
ImagePos = round(get(handles.sldSlice,'Value'));

% Setup text for the slider and show loaded images
set(handles.txtSlice,'String',...
    sprintf('%i/%i',ImagePos,length(handles.MyData.imgT2)));

% Show current T2 image
axes(handles.axImage);
imagesc(handles.MyData.imgT2(ImagePos).Image);
axis equal off;
colormap('gray');

% % Show current Localizer image in temporary axCurv
% axes(handles.axCurv);
% imshow(handles.MyData.imgLoc(ImagePos).Image);

if isfield(handles.MyData,'ROIpos')
   handles.MyData.ROIpos = drawROI(handles);
   guidata(handles.btnZoom,handles);
end

if isfield(handles.MyData,'XLim')
   set(handles.axImage,'XLim',handles.MyData.XLim);
   set(handles.axImage,'YLim',handles.MyData.YLim);
end

end

