function analyseROI( handles, ROI, pos )
%ANALYSEROI() Summary of this function goes here
%   Detailed explanation goes here
ROIvertices = getVertices(ROI);

axes(handles.axImage);
    
h = findobj(handles.axImage,'Tag','ROI');

    if isempty(h)
       rectangle('Position',pos,'Curvature',[1 1],'EdgeColor','b','Tag','ROI');
    else
       set(h,'Position',pos);
    end
    
% Read position of the slider
ImgPosition = round(get(handles.sldImages,'Value'));

w = size(handles.imgT2(ImgPosition).Image,1);
h = size(handles.imgT2(ImgPosition).Image,2);

bw = poly2mask(ROIvertices(:,1),ROIvertices(:,2),w,h);

handles.ROImean = mean(handles.imgT2(ImgPosition).Image(bw));
set(handles.txtMean,'String',...
    sprintf('%d',handles.ROImean));

% Activate fields
set(handles.axCurv,'visible','on');
set(handles.btnReadData, 'enable','on');
set(handles.listMean,'enable','on');
set(handles.listEcho,'enable','on');
set(handles.txtMean,'visible','on')
set(handles.txtT2,'visible','on');

end

