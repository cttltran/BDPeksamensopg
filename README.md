# BDPeksamensopg
BDP eksamensopgave F18
function displayImages(handles)
    ImPos = round(get(handles.sldImPos,'Value'));
    set(handles.txtImPos,'String',sprintf('%i/%i',ImPos,length(handles.MyData.Phase)));
    axes(handles.axMod);
    imagesc(handles.MyData.Modulus(ImPos).Image);
    axis equal off;
    colormap('gray');
    if isfield(handles.MyData,'ROIpos')
        %imellipse(gca,handles.MyData.ROIpos);
        handles.MyData.ROIpos = updateROI(handles);
        guidata(handles.btnZoom,handles);
    end
    axes(handles.axPC);
    imagesc(handles.MyData.Phase(ImPos).Image);
    axis equal off;
    colormap('gray');
    if isfield(handles.MyData,'XLim')
        set(handles.axMod,'XLim',handles.MyData.XLim);
        set(handles.axMod,'YLim',handles.MyData.YLim);
        set(handles.axPC,'XLim',handles.MyData.XLim);
        set(handles.axPC,'YLim',handles.MyData.YLim);
    end
end