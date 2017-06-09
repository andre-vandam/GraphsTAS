function [ p1,p2,u1,u2,y1,y2 ] = VProfile( dataset1,dataset2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
M1 = csvread( dataset1 , 5 , 0 );

y1 = M1(:,2)-5.0;
u1 = M1(:,1);
p1 = [5.6 7.6 10.0];
% p1 = interp1( y1, u1 , yq1 ,'spline' );

M2 = csvread( dataset2 , 5 , 0 );

y2 = M2(:,2)-5.0;
u2 = M2(:,1);
p2 = [6.1 7.8 10.1];
% p2 = interp1( y2 , u2 , yq2 , 'spline' );
end

