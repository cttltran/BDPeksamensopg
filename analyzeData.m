function analyzeData(handles)
%ANALYZEDATA() The function uses data from the listboxes to make an
%eksponential fitting and calculates the T2* value.
%   

% Clear info text
set(handles.txtInfo,'visible','off');

% Get data from listboxes and make an eksponential fitting
listOfEcho = get(handles.listEcho,'String');
x = str2double(listOfEcho(2:end));
listOfMean = get(handles.listMean,'String');
y = str2double(listOfMean(2:end));
f = fit(x,y,'exp1');

% Show the eksponential curv
axes(handles.axCurv);
plot(f,x,y,'bo');
xlabel('Time (TE, ms)');
ylabel('Signal intensity');

% Calculate and show the result T2*
coefficients = f;
slope = coefficients('exp1');
T2 = -(1/slope);
set(handles.txtT2,'visible','on');
set(handles.txtT2,'String',sprintf('%i',T2));

end

