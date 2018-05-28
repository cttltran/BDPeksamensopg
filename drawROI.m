function ROIpos = drawROI(handles)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

axes(handles.axImage);
if isfield(handles.MyData,'ROIpos')
    % Create an ellipse ROI and save it in handles
    ROI = imellipse(gca,handles.MyData.ROIpos);
else
    ROI = imellipse;
end
    % save ROI position
    ROIpos = getPosition(ROI);   
    
    % addNewpositionCalback
    addNewPositionCallback(ROI,@(pos) analyseROI(handles,ROI,pos));
    analyseROI(handles,ROI,ROIpos);
    
    % Limits ROI movement to inside the image 
    lim = makeConstrainToRectFcn('imellipse',...
        get(handles.axImage,'XLim'),...
        get(handles.axImage,'YLim'));
    setPositionConstraintFcn(ROI, lim);
end
