function [h, H_x] = measurementFunction(x, m)
% [h, H_x] = measurementFunction(x, m) returns the predicted measurement
% given a state x and a single map entry m. H_x denotes the Jacobian of the
% measurement function with respect to the state evaluated at the state
% provided.
% Map entry and state are defined according to "Introduction to Autonomous Mobile Robots" pp. 337

alpha=m(1);
r=m(2);
xt=x(1);
yt=x(2);
tt=x(3);
h=[alpha-tt;r-((xt*cos(alpha))+(yt*sin(alpha)))];
H_x=[0,0,-1;-cos(alpha),-sin(alpha),0];
[h(1), h(2), isRNegated] = normalizeLineParameters(h(1), h(2));
if isRNegated 
    H_x(2, :) = - H_x(2, :);
  
end
%Symbolik
% syms alpha r xt yt tt
% f=[xt;yt;tt];
% Symh=[alpha-tt;r-((xt*cos(alpha))+(yt*sin(alpha)))];
% SymH_x=jacobian(Symh,f);
% alpha=m(1);
% r=m(2);
% xt=x(1);
% yt=x(2);
% tt=x(3);
% h=eval(subs(Symh));
% H_x=eval(subs(SymH_x));


    
    
   

