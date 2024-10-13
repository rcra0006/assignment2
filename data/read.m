clc; clear all; close all;

T = readtable('speciesdata.csv');

A = table;
A.Order = T.Order;
A.Class = T.Class;
A.Species = T.Species;


[lights,ia,ic]=unique(A.Order);
nrows = accumarray(ic,1);
B = cell2table([lights num2cell(nrows)],'VariableNames', {'Order' 'nrows'});

C = table;
C.Order = T.Order;
C.Class = T.Class;
C = unique(C);

F = join(C, B, 'Keys','Order','KeepOneCopy','Class');

writetable(F,'rows.csv','Delimiter',',','QuoteStrings','all')
type 'rows.csv';

S = struct;
for [order, class, count] = [C.Order, C.Class, C.nrows]
    order
end