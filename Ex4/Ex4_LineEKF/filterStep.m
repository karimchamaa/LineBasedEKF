function [x_posteriori, P_posteriori] = filterStep(x, P, u, Z, R, M, k, g, b)
% [x_posteriori, P_posteriori] = filterStep(x, P, u, z, R, M, k, g, b)
% returns an a posteriori estimate of the state and its covariance

% additional bells and whistles in case no line was detected, please
% incorporate this at a sensical position in your code

x_priori=x; % rename x and P
P_priori=P;
if size(Z,2) == 0
    x_posteriori = x_priori;
    P_posteriori = P_priori;
    return;   
end

if size(Z)~=0 % In case Z is empty, just update position and do not execute code
[xhat, F_x, F_u] = transitionFunction(x_priori,u, b);
Q=[k*abs(u(1)),0;0,k*abs(u(2))];
Phat=(F_x*P_priori*(F_x)')+(F_u*Q*(F_u)');
[v, H, R] = associateMeasurements(xhat, Phat, Z, R, M, g);
R=blockDiagonal(R); 

for i=1:size(H,3) % Store H in a matrix 
   if i==1
       B=H(:,:,i);
   else
       B=[B;H(:,:,i)];
   end   
end
H=B;

H=reshape(H,[size(R,2) size(Phat,2)]);                               
Sigma=(H*Phat*H')+R;  
Kt=Phat*H'*(Sigma^-1);
v=reshape(v,[size(Kt,2) size(xhat,2)]);

x_posteriori=xhat+(Kt*v);
P_posteriori=Phat-(Kt*Sigma*Kt');

end


 

