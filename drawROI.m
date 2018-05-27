function ROIpos = drawROI(handles)
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
    addNewPositionCallback(ROI,@(pos) analyseROI(handles,ROI,pos));
    analyseROI(handles,ROI,ROIpos);
    
    % Limits ROI movement to inside the image 
    lim = makeConstrainToRectFcn('imellipse',...
        get(handles.axImage,'XLim'),...
        get(handles.axImage,'YLim'));
    setPositionConstraintFcn(ROI, lim);
end

