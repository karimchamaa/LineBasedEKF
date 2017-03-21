syms alpha sl sr tt1 xt yt b r; %Define them as symbols
x=[xt;yt;tt1];
u=[sl;sr];
f(sl,sr,tt1,b)=x+[((sl+sr)/2)*cos(tt1+((sr-sl)/(2*b)));((sl+sr)/2)*sin(tt1+((sr-sl)/(2*b)));(sr-sl)/b];
%Problem1
F_x(sl,sr,tt1,b)=jacobian(f,x)
F_u(sl,sr,tt1,b)=jacobian(f,u)
%Problem 2
h=[alpha-tt1;r-((xt*cos(alpha))+(yt*sin(alpha)))];
H_x=jacobian(h,x)







                                                                           