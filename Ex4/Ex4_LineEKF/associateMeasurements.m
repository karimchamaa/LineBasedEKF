function [v, H, R] = associateMeasurements(x, P, Z, R, M, g)
% [v, H, R] = associateMeasurements(x, P, Z, R, M, g) returns a set of
% innovation vectors and associated jacobians and measurement covariances
% by matching line features by Mahalanobis distance.

t=1;% used for index v and H
for i=1:size(Z,2)  %Outer Loop, Column size Z
 for j=1:size(M,2)%Inner Loop, Column size M
[h(:,j), H(:,:,i)] = measurementFunction(x, M(:,j)); %Call the measurment function
vv(:,j)=Z(:,i)-h(:,j);
HH(:,:,i)=H(:,:,i);
Sigma=(HH(:,:,i)*P*HH(:,:,i)')+R(:,:,i);
d=vv(:,j)'*(Sigma^-1)*vv(:,j);
q(:,j)=d;% Store all the distances in a matrix
b=min(q);%Check for the minimum of the distances stored in the matrix
if(d<=g^2 && d==b)%Update v and H only if conditions met
vvv=vv(:,j);
HHH=HH(:,:,i);
end
 end
v(:,t)=vvv;
H(:,:,t)=HHH;
t=t+1;
end
end



    

    






