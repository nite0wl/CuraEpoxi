function [ dy ] = heat( t,y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    %y(2)=h
    %y(3)=T_sur
    %y(4)=T_inf
    %y(5)=c
    %y(6)=density
    %y(7)=e
    %y(8)=L
    %y(9)=limit
    
    A=1/(y(6)*y(8)*y(5));
    B=y(7)*5.67e-8;
    dy=zeros(2,1);
    
    dy(1)=-A*(y(2)*((y(1))-y(4))+...
    B*((y(1))^4-y(3)^4));
    
    dy(2)=0;
    dy(3)=0;
    dy(4)=0;
    dy(5)=0;
    dy(6)=0;
    dy(7)=0;
    dy(8)=0;
end

