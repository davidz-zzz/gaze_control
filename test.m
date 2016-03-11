

clear all;
close all;

%2D example 
NOISE = 1;
RAW = peaks(25);
RAW = RAW .* (rand(25)*NOISE);
[x,y] = meshgrid(1:size(RAW,1),1:size(RAW,2));
x=x(:);y=y(:);
z = reshape(RAW,[size(RAW,1)*size(RAW,2) 1]);
subplot(1,2,1);
surf(RAW);

ti = 0:0.5:25; 
[XI,YI] = meshgrid(ti,ti);

%Matlab interpolation 
ZI = griddata(x,y,z,XI,YI,'cubic');

%RBF interpolation 
rbf=rbfcreate([x'; y'], z','RBFFunction','gaussian'); 
ZI = rbfinterp([XI(:)'; YI(:)'], rbf); 
ZI = reshape(ZI, size(XI));


subplot(1,2,2);
surf(ZI);