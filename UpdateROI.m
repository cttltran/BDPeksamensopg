
function ROIpos = updateROI(handles)
    axes(handles.axMod);
    if isfield(handles.MyData,'ROIpos')
        ROI = imellipse(gca,handles.MyData.ROIpos);
    else
        ROI = imellipse;
    end
    ROIpos = getPosition(ROI);
    addNewPositionCallback(ROI,@(pos) calcFlow(handles,ROI,pos));
    calcFlow(handles,ROI, ROIpos);
end



