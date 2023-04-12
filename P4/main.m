% Clean windows, workspace, etc
clear;
close all;
clc;

% Creat a folder for output results
mkdir 'results'

%%  Question (1)
% Read in the image
I_t2 = imread('texture2.gif');
I_t2 = double(I_t2);

%applying Gabor filter and plot 3D plot
m_t2 = Gabor(I_t2,8,0.059,3*pi/4);
figure(1);
mesh(1:size(m_t2,1),1:size(m_t2,2),m_t2);title('applying Gabor filter to texture2');
saveas(figure(1), 'results\1_1.png');

%applying smooth filter and plot 3D plot
mprime_t2 = smooth(m_t2,24);
figure(2);
mesh(1:size(mprime_t2,2),1:size(mprime_t2,1),mprime_t2);title('applying smooth filter to texture2');
saveas(figure(2), 'results\1_2.png');

%scale the pixel value of m between 0-255 and plot the gray-scale image
m_t2 = m_t2*(1/max(max(m_t2)));
figure(3);
imshow(m_t2);title('gray-scale texture2 m(x,y)');
saveas(figure(3), 'results\1_3.png');

mprime_t2 = mprime_t2*(1/max(max(mprime_t2)));
figure(4);
imshow(mprime_t2);title('gray-scale texture2 m’(x,y)');
saveas(figure(4), 'results\1_4.png');

%Threshold the final filtered output m' and show superimposed result
thresh2 = 0.5*max(mprime_t2(:))+0.5*min(mprime_t2(:));
mprime_t2_thresh = mprime_t2>thresh2;
I_t2_seg = mprime_t2_thresh*0.5+I_t2(2*32+1:size(I_t2,1)-2*32,2*32+1:size(I_t2,2)-2*32)*0.5;
figure(5);
imshow(I_t2_seg);title('superimposed texture2');
saveas(figure(5), 'results\1_5.png');


%%  Question (2)
% Read in the image
I_t1 = imread('texture1.gif');
I_t1 = double(I_t1);

%applying Gabor filter and plot 3D plot
m_t1 = Gabor(I_t1,24,0.042,0);
figure(6);
mesh(1:size(m_t1,1),1:size(m_t1,2),m_t1);title('applying Gabor filter to texture1');
saveas(figure(6), 'results\2_1.png');

%applying smooth filter and plot 3D plot
m_t1_prime = smooth(m_t1,24);
figure(7);
mesh(1:size(m_t1_prime,2),1:size(m_t1_prime,1),m_t1_prime);title('applying smooth filter to texture1');
saveas(figure(7), 'results\2_2.png');

%scale the pixel value of m between 0-255 and plot the gray-scale image
m_t1 = m_t1*(1/max(max(m_t1)));
figure(8);
imshow(m_t1);title('gray-scale texture1 m(x,y)');
saveas(figure(8), 'results\2_3.png');

m_t1_prime = m_t1_prime*(1/max(max(m_t1_prime)));
figure(9);
imshow(m_t1_prime);title('gray-scale texture1 m’(x,y)');
saveas(figure(9), 'results\2_4.png');

%Threshold the final filtered output m' and show superimposed result
thresh1 = 0.5*(max(m_t1_prime(:))+min(m_t1_prime(:)));
m_t1_thresh = m_t1_prime>thresh1;
I_t1_seg = m_t1_thresh*0.5+I_t1(2*48+1:size(I_t1,1)-2*48,2*48+1:size(I_t1,2)-2*48)*0.5;
figure(10);
imshow(I_t1_seg);title('superimposed texture1');
saveas(figure(10), 'results\2_5.png');

%%  Question (3)
% Read in the image
I_3 = imread('d9d77.gif');
I_3 = double(I_3)/255;

%applying Gabor filter and plot 3D plot
m_3 = Gabor(I_3,36,0.063,pi/3);
figure(11);
mesh(1:size(m_3,2),1:size(m_3,1),m_3);title('applying Gabor filter to d9d77');
saveas(figure(11), 'results\3_1.png');

%scale the pixel value of m between 0-255 and plot the gray-scale image
m_3 = m_3*(1/max(max(m_3)));
figure(12);
imshow(m_3);title('gray-scale d9d77 m(x,y)');
saveas(figure(12), 'results\3_2.png');

%Threshold the filtered output m and show superimposed result
thresh3 = 0.5*(max(m_3(:))+min(m_3(:)));
m_3_thresh = m_3>thresh3;
I_3_seg = m_3_thresh*0.5+I_3(2*36+1:size(I_3,1)-2*36,2*36+1:size(I_3,2)-2*36)*0.5;
figure(13);
imshow(I_3_seg);title('superimposed d9d77');
saveas(figure(13), 'results\3_3.png');


%%  Question (4)
% Read in the image
I_d4d29 = imread('d4d29.gif');
I_d4d29 = double(I_d4d29)/255;

%applying Gabor filter and plot 3D plot
m_d4d29 = Gabor(I_d4d29,8,0.6038,-50.5*pi/180);
figure(14);
mesh(1:size(m_d4d29,2),1:size(m_d4d29,1),m_d4d29);title('applying Gabor filter to d4d29');
saveas(figure(14), 'results\4_1.png');

%applying smooth filter and plot 3D plot
m_d4d29_prime = smooth(m_d4d29,40);
figure(15);
mesh(1:size(m_d4d29_prime,2),1:size(m_d4d29_prime,1),m_d4d29_prime);title('applying smooth filter to d4d29');
saveas(figure(15), 'results\4_2.png');

%scale the pixel value of m between 0-255 and plot the gray-scale image
m_d4d29 = m_d4d29*(1/max(max(m_d4d29)));
figure(16);
imshow(m_d4d29);title('gray-scale d4d29 m(x,y)');
saveas(figure(16), 'results\4_3.png');

m_d4d29_prime = m_d4d29_prime*(1/max(max(m_d4d29_prime)));
figure(17);
imshow(m_d4d29_prime);title('gray-scale d4d29 m’(x,y)');
saveas(figure(17), 'results\4_4.png');

%Threshold the final filtered output m' and show superimposed result
thresh4 = 0.5*(max(m_d4d29_prime(:))+min(m_d4d29_prime(:)));
m_d4d29_thresh = m_d4d29_prime>thresh4;
I_d4d29_seg = m_d4d29_thresh*0.5+I_d4d29(2*48+1:size(I_d4d29,1)-2*48,2*48+1:size(I_d4d29,2)-2*48)*0.5;
figure(18);
imshow(I_d4d29_seg);title('uperimposed d4d29');
saveas(figure(18), 'results\4_5.png');

