function ROIpos = drawROI(handles)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

axes(handles.axImage);
if isfield(handles.MyData,'ROIpos')
    % opret elliptisk ROI og gem dens handle 
    ROI = imellipse(gca,handles.MyData.ROIpos);
else
    ROI = imellipse;
end
    % gem ROI positionerne
    ROIpos = getPosition(ROI);   
    
    % addNewpositionCalback
    addNewPositionCallback(ROI,@(pos) calcROI(handles,ROI,pos));
    calcROI(handles,ROI,ROIpos);
end

