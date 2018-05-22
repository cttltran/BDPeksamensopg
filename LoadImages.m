function [handles] = LoadImages(handles)
%LOADIMAGES Summary of this function goes here
%Detailed explanation goes here

dirName = uigetdir('ExamDICOMdata','Choose a library with dicom files');
if dirName ~= 0
    files = dir(fullfile(dirName, '*.dcm'));
    num_files = length(files);
    wb = waitbar(0,'Loading dicom files...');
    for i = 1:num_files
    Info = dicominfo(fullfile(dirName,files(i).name)); 
    handles.MyData.Images = dicomread(fullfile(dirName,files(i).name));
    handles.MyData.Info = Info;
    end
    waitbar(i/num_files,wb);
end

if exist('wb','var')
    close(wb);
end

numDICOM = length(MyData.DICOM);
set(handles.sldImage,'Max',numDICOM);
set(handles.sldImage,'Value',1);
set(handles.sldImage,'SliderStep',[1/(numDICOM-1) 5/(numDICOM-1)]);

set(handles.txtNum,'String',sprintf('1/%d',numDICOM));

end

