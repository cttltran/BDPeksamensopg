
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

%clean matlab for a  fresh run of this program
clear all          %clears the workspace
close all          %closes open figures, etc.
clc                %clears the command window

%% T1 fitting
% Where to find the DICOM data 
% T1path = 'C:/Users/steffen/Documents/MATLAB/T1mapping/Fit_ex/T1data/';

files = dir([T1path '*']);
n = 0;
% Get list of all filenames in folder
for (i = 1:length(files))
	if (~files(i).isdir)
        n = n+1;
        dicomFiles{n} = files(i).name;
    end
end

TInumber = 1;
% Browse through all files in folder
for (i = 1:length(dicomFiles))
    info = dicominfo( fullfile(T1path, dicomFiles{i} ) );   % Load Dicom tag parameters to 'info'
    TI = info.InversionTime;  % Inversion time TI, this might not be the right parameter
    TIs( TInumber ) = TI;
    image = dicomread(info);

    if (TInumber == 1)
        figure, colormap(gray), imagesc(image); % Display image in grayscale
        h = impoly();   % Allow user to draw a ROI
        mask = createMask(h);   % mask is image part in ROI
    end
    
    val( TInumber ) = mean(image(mask));
    TInumber = TInumber+1;
end

plot(TIs, val);
t = TIs';   % from row to column vectors, ' means transpose
y = val';

% Negate the values before zero-crossing (if inversion recovery is used)
[minval, zeropoint] = min(y);
y_cor = [-y(1:zeropoint); y(zeropoint+1:size(y))];
hold on
plot(t, y_cor, 'red');
hold off

% Do function fitting to the data stored in y_cor
% Use e.g the non-linear fitting function 'lsqcurvefit'
% If for example you want to fit the data to the function:  y = At+Bt^2)
% this is done by first setting initial values for the A and B parameters,

x0 = [A_init B_init]; 
% and then define the model function:
F = @(x,t)(x(1)*t+x(2)*t^2);     % Notice: this should be changed to the right function

% Then do the non-linear fitting
[x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,t,y_cor);

% and plot the model function together with the data
hold on
plot(t,F(x,t), 'green');
hold off

% Print out resulting parameters values
x(1)
x(2)
