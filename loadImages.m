function MyData = loadImages(handles)
%LOADIMAGES The function loads dicom files from a library chosen by the
%user and split the images in Localizer and T2* images
% The function limits the possible file formats to be .dcm files

% %% clear axImage
% axes(handles.axImage);
% cla;

%% Load dicom files 

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
            MyData.imgLoc(countLoc).Image = dicomread(fullfile(dirName,files(ii).name));
            MyData.imgLoc(countLoc).Info = Info;
            MyData.imgLoc(countLoc).EchoTime = Info.EchoTime; 
            MyData.imgLoc(countLoc).SliceLocation = Info.SliceLocation;
            % Normalize images
            MyData.imgLoc(countLoc).Image = double(MyData.imgLoc(countLoc).Image)...
                ./max(max(double(MyData.imgLoc(countLoc).Image)));
            countLoc = countLoc + 1;
        else
            MyData.imgT2(countT2).Image = dicomread(fullfile(dirName,files(ii).name));
            MyData.imgT2(countT2).Info = Info;
            MyData.imgT2(countT2).EchoTime = Info.EchoTime; 
            MyData.imgT2(countT2).SliceLocation = Info.SliceLocation;
            % Normalize images
            MyData.imgT2(countT2).Image = double(MyData.imgT2(countT2).Image)...
                ./max(max(double(MyData.imgT2(countT2).Image)));
            countT2 = countT2 + 1;
        end
            waitbar(ii/numFiles,wb);
    end
    
    if exist('wb','var')
        close(wb);
    end

        % setup slider for numbers of images
        numT2 = length(MyData.imgT2);
        set(handles.sldSlice,'Max',numT2);
        set(handles.sldSlice,'Min',1);
        set(handles.sldSlice,'Value',1);
        set(handles.sldSlice,'SliderStep',[1/(numT2-1) 5/(numT2-1)]);

        % Set text to slider to numbers of images
        set(handles.txtSlice,'String',sprintf('1/%d',numT2));

end

