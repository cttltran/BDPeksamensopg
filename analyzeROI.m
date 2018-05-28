function analyzeROI( handles, ROI, pos )
%ANALYZEROI() The function calculates the mean value of the current
%vertices in the drawn ROI by the user
%   The function limits the user to edit the drawn ROI and the user has to
%   click on Draw ROI again to draw and calculate mean for new drawn ROI. 

ROIvertices = getVertices(ROI);
axes(handles.axImage);
h = findobj(handles.axImage,'Tag','ROI');

    if isempty(h)
       rectangle('Position',pos,'Curvature',[1 1],'EdgeColor','b','Tag','ROI');
    else
       set(h,'Position',pos);
    end
    
% Read position of the slider and specify the size of te image
ImgPosition = round(get(handles.sldImages,'Value'));
w = size(handles.imgT2(ImgPosition).Image,1);
h = size(handles.imgT2(ImgPosition).Image,2);

% Create mask
bw = poly2mask(ROIvertices(:,1),ROIvertices(:,2),w,h);

% Calculate mean for current ROI
handles.ROImean = mean(handles.imgT2(ImgPosition).Image(bw));
set(handles.txtMean,'String',...
    sprintf('%d',handles.ROImean));

% Activate fields to analyze data
set(handles.axCurv,'visible','on');
set(handles.btnLoadData, 'enable','on');
set(handles.listMean,'enable','on');
set(handles.listEcho,'enable','on');
set(handles.txtMean,'visible','on');

end

