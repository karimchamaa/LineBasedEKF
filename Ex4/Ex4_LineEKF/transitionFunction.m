function [f, F_x, F_u] = transitionFunction(x,u, b)

tt1=x(3); %Tetha t-1
sl=u(1); %Delta SL
sr=u(2); %Delta SRx
f=x+[((sl+sr)/2)*cos(tt1+((sr-sl)/(2*b)));((sl+sr)/2)*sin(tt1+((sr-sl)/(2*b)));(sr-sl)/b];
F_x=[1,0,-sin(tt1 - (sl - sr)/(2*b))*(sl/2 + sr/2)
     0,1,cos(tt1 - (sl - sr)/(2*b))*(sl/2 + sr/2) 
     0,0,1];
F_u=[cos(tt1 - (sl - sr)/(2*b))/2 + (sin(tt1 - (sl - sr)/(2*b))*(sl/2 + sr/2))/(2*b), cos(tt1 - (sl - sr)/(2*b))/2 - (sin(tt1 - (sl - sr)/(2*b))*(sl/2 + sr/2))/(2*b)
    sin(tt1 - (sl - sr)/(2*b))/2 - (cos(tt1 - (sl - sr)/(2*b))*(sl/2 + sr/2))/(2*b), sin(tt1 - (sl - sr)/(2*b))/2 + (cos(tt1 - (sl - sr)/(2*b))*(sl/2 + sr/2))/(2*b)  
    -1/b,1/b];
end



%Symbolic Alorithm 
% syms sl sr tt1 xt yt a;
% Symf=[xt;yt;tt1] + [((sl+sr)/2)*cos(tt1+((sr-sl)/(2*a)));((sl+sr)/2)*sin(tt1+((sr-sl)/(2*a)));(sr-sl)/a];
% SymF_x=jacobian(Symf,[xt;yt;tt1]);
% SymF_u=jacobian(Symf,[sl;sr]);
% Evf=eval(subs(Symf,{xt,yt,tt1,sl,sr,a},{x(1),x(2),x(3),u(1),u(2),b}));
% EvF_x=eval(subs(SymF_x,{xt,yt,tt1,sl,sr,a},{x(1),x(2),x(3),u(1),u(2),b}));
% EvF_u=eval(subs(SymF_u,{xt,yt,tt1,sl,sr,a},{x(1),x(2),x(3),u(1),u(2),b}));
% f=Evf;
% F_x=EvF_x;
% F_u=EvF_u;










