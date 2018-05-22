function [handles] = LoadImages(handles)
%LOADIMAGES Summary of this function goes here
%Detailed explanation goes here

%%

% Prompt user to choose a file
[file, path] = uigetfile({'*.jpg'},'Vælg en patient');

% Checking that the file contains data
if file ~= 0
    wb = waitbar(0,'Henter fil...');
    % Loads the image into the output
    image = imread(fullfile(path,file));
    handles = inactivateFields(handles);
    waitbar(0.5, wb, 'Opdaterer GUI');
    % Show the loaded image
    set(handles.axOriginal, 'visible', 'on')
    axes(handles.axOriginal);
    imshow(image);
    title(file);
    
    % Make it possible to process the image
    set(handles.btn_Segmentate, 'enable', 'on')
    handles.MyData.Original = image;
    handles.MyData.FileName = file;
   close(wb);
end

end

