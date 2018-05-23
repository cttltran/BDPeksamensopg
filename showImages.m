function showImages(handles)
%SHOWIMAGES The function displays images from loaded dicom files
%   

ImagePos = round(get(handles.sldImages,'Value'));

set(handles.txtNum,'String',sprintf('%i/%i',ImagePos,length(handles.MyData.Image)));

axes(handles.axImage);
imagesc(handles.MyData.Image(ImagePos));

axis equal off;
colormap('gray');

end

