function analyseROI( handles, ROI, pos )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

ROIvertices = getVertices(ROI);

axes(handles.axImage);
    
h = findobj(handles.axImage,'Tag','ROI');

    if isempty(h)
       rectangle('Position',pos,'Curvature',[1 1],'EdgeColor','b','Tag','ROI');
    else
       set(h,'Position',pos);
    end

% Read position of slider
ImgPosition = round(get(handles.sldSlice,'Value'));
w = size(handles.MyData.imgT2(ImgPosition).Image,1);
h = size(handles.MyData.imgT2(ImgPosition).Image,2);
bw = poly2mask(ROIvertices(:,1),ROIvertices(:,2),w,h);
handles.MyData.ROImean = mean(handles.MyData.imgT2(ImgPosition).Image(bw));
% Temporary display of mean 
set(handles.txtT2_1,'String',...
    sprintf('%d',handles.MyData.ROImean));

% ImgMean = zeros(length(handles.MyData.imgT2));
%     for i=1:length(handles.MyData.imgT2)
%         currentDicom = handles.MyData.imgT2(i).Image;
%         ImgMean(i)=mean(currentDicom(bw()));
%     end
    
end