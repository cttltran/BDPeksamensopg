function MyData = loadImages(handles)
%LOADIMAGES The function loads dicom files from a library chosen by the
%user
% The function limits the possible file formats to be .dcm files

% Prompt user to choose a library with dicom files
dirName = uigetdir('ExamDICOMdata','Choose a library with dicom files');

% Check if the library contains data
% and load images and info into the output
if dirName ~= 0
    files = dir(fullfile(dirName, '*.dcm'));
    numFiles = length(files);
    wb = waitbar(0,'Loading dicom files...');
    % Diable GUI fields when loading images
    % handles = disableFields(handles);
    for ii=1:numFiles
    Info = dicominfo(fullfile(dirName,files(ii).name));
    MyData.Image = dicomread(fullfile(dirName,files(ii).name));
    MyData.Info = Info;
    MyData.EchoTime = Info.EchoTime; 
    MyData.sliceLocation = Info.SliceLocation;
    end
    waitbar(ii/numFiles,wb);
end

if exist('wb','var')
    close(wb);
end

% Save number of images and setup slider
numDICOM = length(MyData.Image);
set(handles.sldImages,'Max',numDICOM);
set(handles.sldImages,'Value',1);
set(handles.sldImages,'SliderStep',[1/(numDICOM-1) 5/(numDICOM-1)]);

% Set text to slider to numbers of images
set(handles.txtNum,'String',sprintf('1/%d',numDICOM));

end

