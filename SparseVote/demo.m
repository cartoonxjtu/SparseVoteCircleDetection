clc;
clear;
close all;

tmp_path = mfilename('fullpath');
[path] = fileparts(tmp_path);
r_min = 2; 
r_max = 20;
nSample = 130;
rSample = 33;
aa = 0;
%% config the detection parameters.
max_auc = 0;
im_name = [path,filesep,'bubble_1.bmp'];  
det_name = [path,filesep,'bubble_det_1.txt'];

str_excu = sprintf(['sparsevote %s %s %f %f %f %f'],im_name,det_name,nSample,rSample,r_min,r_max); 
tic;
dos(str_excu);
toc;

fid = fopen(det_name);
if(fid<0)
  error('There is not circle detection results for %s.',tmp_im_name);
else
    circle_det = fscanf(fid,'%f',[4,inf]);
end
fclose(fid);

circle_det = circle_det';
circen= circle_det(:,1:2);
cirrad = circle_det(:,3);
val_lmax = circle_det(:,4);

Threshold = 0.06;
index = find(val_lmax > 65536 * Threshold);
circen = circen(index, 1:2);
cirrad = cirrad(index);
val_lmax = val_lmax(index);

im = imread(im_name);
figure(10);
clf;
imshow(im,[]);
hold on;
nseg = 50;
p_str = 'r-';
for ii = 1:size(circen,1)
   DrawCircle(circen(ii,1),circen(ii,2),cirrad(ii,1),nseg,p_str);
end
hold off;
    
bound = [];  
figure(11); 
clf;
imshow(im); 
hold on;
for i = 1 : size(val_lmax)
    bound(i,:) = [-cirrad(i)+circen(i,1) -cirrad(i)+circen(i,2) 2*cirrad(i) 2*cirrad(i)];
    poly2 = rect2poly(bound(i,:));
    plot(poly2(:,1),poly2(:,2),'g-','linewidth',2);
end;
hold off;

