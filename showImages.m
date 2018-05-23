function showImages(handles)
%SHOWIMAGES The function displays images from loaded dicom files
%   

% Read the position of the image of the slider
ImagePos = round(get(handles.sldImages,'Value'));

% Setup text for the slider and show loaded images
set(handles.txtNum,'String',sprintf('%i/%i',ImagePos,length(handles.MyData.Dicom)));
axes(handles.axImage);
imshow(handles.MyData.Dicom(ImagePos).Image);
axis equal off;

% Setup contrast for the images
% set(gca,'clim',[0 50]);


end

