function [handles]= saveData(handles)
%SAVEDATA Summary of this function goes here
%   Detailed explanation goes here

e = actxserver('Excel.Application');
filename = 'oxygeneringsgraddata.xlsx';
eW = e.Workbooks;
eF = eW.Open([pwd '\' filename]);

eR = e.ActiveSheet.UsedRange.Address;

range = ['A' eR(end)+1];

eW.Close;
e.Quit;
e.delete;

MyData = 1;

% Write to file
xlswrite(filename, MyData, 1, range);
set(handles.btnSave, 'enable', 'off');
end

