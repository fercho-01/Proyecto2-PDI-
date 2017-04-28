clear all;close all;clc;
%Cargar imagen original
a = imread('DSC_2663.jpg');
%cargar mascara
b = imread('mascara2.jpg');

%usar la mascara para seleccionar la región de interes en la imagen
%original
b(b>0)=255;
a(b==255)=0;

%recortar la imagen original
[fil,col] = find(rgb2gray(a)>0);
fmin = min(fil(:));
fmax = max(fil(:));
cmin = min(col(:));
cmax = max(col(:));
c = a(fmin:fmax,cmin:cmax,:);
figure(1);
imshow(c);impixelinfo();

%extraer los canales r,g,b de la imagen
r = c(:, :, 1);
g = c(:, :, 2);
b = c(:, :, 3);

%aplicar median filter a cada canal de la imagen
redMF = medfilt2(r, [40 40]);
greenMF = medfilt2(g, [40 40]);
blueMF = medfilt2(b, [40 40]);

%reconstrucción de la imagen
rgbFixed = cat(3, redMF, greenMF, blueMF);
figure(2);imshow(rgbFixed);impixelinfo();

%reconstrucción de la imagen
rgbFixed = cat(3, redMF, greenMF, blueMF);
figure(2);imshow(rgbFixed);impixelinfo();

%Binarización de la imagen
redMF(blueMF>230) = 0;
greenMF(blueMF>230) = 0;
blueMF(blueMF>230) = 0;

redMF(blueMF ~= 0) = 255;
greenMF(blueMF ~= 0) = 255;
blueMF(blueMF ~= 0) = 255;

%reconstrucción de la imagen
rgbFixed = cat(3, redMF, greenMF, blueMF);
figure(3);imshow(rgbFixed);impixelinfo();

Ibw = im2bw(rgbFixed);
Ibw = imfill(Ibw,'holes');


Ilabel = bwlabel(Ibw);
stat = regionprops(Ilabel,'centroid');
imshow(rgbFixed); hold on;
for x = 1: numel(stat)
    plot(stat(x).Centroid(1),stat(x).Centroid(2),'ro');
end

%A = imread('circlesBrightDark.png');
%imshow(A)

% c  = rgb2gray(rgbFixed);
% C = imbinarize(c);
% figure(4),imshow(C);
% [B,L] = bwboundaries(C,'noholes');
% imshow(label2rgb(L, @gray, [.5 .5 .5]))
% for k = 1:length(B)
%    boundary = B{k};
%    plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
% end
% 
% Rmin = 1;
% Rmax = 1000;
% [centersBright, radiiBright] = imfindcircles(rgbFixed,[Rmin Rmax],'ObjectPolarity','bright');
% %[centersDark, radiiDark] = imfindcircles(rgbFixed,[Rmin Rmax],'ObjectPolarity','dark');
% viscircles(centersBright, radiiBright,'Color','b');

% Rmin = 1;
% Rmax = 10;
% [centersBright, radiiBright] = imfindcircles(rgbFixed,[Rmin Rmax],'ObjectPolarity','bright');
% %[centersDark, radiiDark] = imfindcircles(rgbFixed,[Rmin Rmax],'ObjectPolarity','dark');
% viscircles(centersBright, radiiBright,'Color','b');