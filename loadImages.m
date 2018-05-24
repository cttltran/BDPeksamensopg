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
    
    count = 1;
    for ii=1:numFiles
        Info = dicominfo(fullfile(dirName,files(ii).name));
        
        MyData.Dicom(count).Image = dicomread(Info);
        % Update the images to double with values between 0 to 1
        MyData.Dicom(count).Image = double(MyData.Dicom(count).Image)...
            ./max(max(double(MyData.Dicom(count).Image)));
        MyData.Dicom(count).Info = Info;
        MyData.Dicom(count).EchoTime = Info.EchoTime; 
        MyData.Dicom(count).SliceLocation = Info.SliceLocation;
        waitbar(ii/numFiles,wb);
        
       count = count + 1;
    end
    
if exist('wb','var')
    close(wb);
end

% Save number of images and setup slider
numDICOM = length(MyData.Dicom);
set(handles.sldImages,'Max',numDICOM);
set(handles.sldImages,'Min',1);
set(handles.sldImages,'Value',1);
set(handles.sldImages,'SliderStep',[1/(numDICOM-1) 5/(numDICOM-1)]);

% Set text to slider to numbers of images
set(handles.txtNum,'String',sprintf('1/%d',numDICOM));


end

