function handles = loadImages(handles)
%LOADIMAGES() The function loads dicom files from a library chosen by the
%user and split the images in Localizer and T2* images
% The function limits the possible file formats to be .dcm files

%% clear axis
axes(handles.axImage);
cla;

%% Load dicom files and split in T2* and Localizer images

% Prompt user to choose a library with dicom files
dirName = uigetdir('ExamDICOMdata','Choose a library with dicom files');

% Check if the library contains data and load images 
if dirName ~= 0
    files = dir(fullfile(dirName, '*.dcm'));
    numFiles = length(files);
    wb = waitbar(0,'Loading dicom files...');
    countLoc = 1;
    countT2 = 1;
    for ii=1:numFiles
        Info = dicominfo(fullfile(dirName,files(ii).name)); 
        if isempty(strfind(Info.SeriesDescription,'T2*'))
            handles.imgLoc(countLoc).Image = dicomread(fullfile(dirName,files(ii).name));
            handles.imgLoc(countLoc).Info = Info;
            
            % Normalize images
            handles.imgLoc(countLoc).Image = double(handles.imgLoc(countLoc).Image)...
                ./max(max(double(handles.imgLoc(countLoc).Image)));
            
            countLoc = countLoc + 1;
        else
            handles.imgT2(countT2).Image = dicomread(fullfile(dirName,files(ii).name));
            handles.imgT2(countT2).Info = Info;
            handles.imgT2(countT2).EchoTime = Info.EchoTime; 
            handles.imgT2(countT2).SliceLocation = Info.SliceLocation;
            %handles.imgT2(countT2).EchoNumber = Info.EchoNumber;
            
            % Normalize images
            handles.imgT2(countT2).Image = double(handles.imgT2(countT2).Image)...
                ./max(max(double(handles.imgT2(countT2).Image)));
            
            countT2 = countT2 + 1;
        end
            waitbar(ii/numFiles,wb);
    end
    
if exist('wb','var')
    close(wb);
end
    
% Setup fields
numT2 = length(handles.imgT2);
set(handles.sldImages,'Max',numT2);
set(handles.sldImages,'Min',1);
set(handles.sldImages,'Value',1);
set(handles.sldImages,'SliderStep',[1/(numT2-1) 5/(numT2-1)]);
set(handles.txtNum,'String',sprintf('1/%d',numT2));
    
end

