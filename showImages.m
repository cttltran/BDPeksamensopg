function showImages(handles)
%SHOWIMAGES The function displays images from loaded dicom files
%   The function also gives the opportunity to edit contrast

% Read the position of the slider
ImagePos = round(get(handles.sldImages,'Value'));

% Setup text for the slider and show loaded images
set(handles.txtNum,'String',sprintf('%i/%i',ImagePos,length(handles.MyData.Dicom)));
axes(handles.axImage);
imshow(handles.MyData.Dicom(ImagePos).Image);
axis equal off;
end

