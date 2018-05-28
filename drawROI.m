function ROIpos = drawROI(handles)
%DRAWROI() Summary of this function goes here
%   Detailed explanation goes here

% Setup draw ROI info to user
set(handles.txtInfo, 'visible','on');
drawROI_Info = sprintf('Click and drag the mouse on the image to specify the size and position of the ROI ellipse.');
set(handles.txtInfo,'String',drawROI_Info);

axes(handles.axImage);
if isfield(handles,'ROIpos')
    % Create an ellipse ROI and save it in handles
    ROI = imellipse(gca,handles.ROIpos);
else
    ROI = imellipse;
end
    % Save ROI position
    ROIpos = getPosition(ROI);   
    
    % Live plot and calculate mean with addNewpositionCalback
    addNewPositionCallback(ROI,@(pos) analyzeROI(handles,ROI,pos));
    analyzeROI(handles,ROI,ROIpos);
    
    % Limits ROI movements to inside the image axis
    lim = makeConstrainToRectFcn('imellipse',...
        get(handles.axImage,'XLim'),...
        get(handles.axImage,'YLim'));
    setPositionConstraintFcn(ROI, lim);
    
end

