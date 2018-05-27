function [handles]= saveData(handles)
%SAVEDATA Summary of this function goes here
%   Detailed explanation goes here

% Open existing File by use of ActiveX
excel = actxserver('Excel.Application');
filename = 'oxygeneringsgraddata.xlsx';
%Add a workbook
excelW = excel.Workbooks;
excelF = excelW.Open([pwd '\' filename]);

excelR = excel.ActiveSheet.UsedRange.Address;

range = ['A' eR(end)+1];

excelW.Close;
excel.Quit;
excel.delete;

MyData = 1;

% Write to file
xlswrite(filename, MyData, 1, range);
set(handles.btnSave, 'enable', 'off');
end

