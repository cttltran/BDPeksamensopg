function handles = saveToExcel (handles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

clc
clear 
% Your Inputs
%NewName = {'Adnan'};

NewValues ={(handles.txtNum)};

% Check if you have created an Excel file previously or not 
checkforfile=exist(strcat(pwd,'\','ExcelFile.xls'),'file');
if checkforfile==0; % if not create new one
    header = {'SliceLocation', 'Echotime' 'Mean' , 'T2'};
    xlswrite('ExcelFile',header,'Sheetname','A1');
    N=0;
else % if yes, count the number of previous inputs
    N=size(xlsread('ExcelFile','Sheetname'),1);
end
% add the new values (your input) to the end of Excel file
AA=strcat('A',num2str(N+2));
BB=strcat('B',num2str(N+2));
%xlswrite('ExcelFile',NewName,'Sheetname',AA);
xlswrite('ExcelFile',NewValues,'Sheetname',BB);



end

