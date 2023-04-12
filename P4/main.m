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
m = Gabor(I_t2,8,0.059,3*pi/4);
figure(1);
mesh(1:size(m,1),1:size(m,2),m);title('applying Gabor filter to texture2');
saveas(figure(1), 'results\1_1', 'png');

%applying smooth filter and plot 3D plot
mprime = smooth(m,24);
figure(2);
mesh(1:size(mprime,2),1:size(mprime,1),mprime);title('applying smooth filter to texture2');
saveas(figure(2), 'results\1_2', 'png');

%scale the pixel value of m between 0-255 and plot the gray-scale image
m = m*(1/max(max(m)));
figure(3);
imshow(m);title('gray-scale texture2 m(x,y)');
saveas(figure(3), 'results\1_3.png');

mprime = mprime*(1/max(max(mprime)));
figure(4);
imshow(mprime);title('gray-scale texture2 m’(x,y)');
saveas(figure(4), 'results\1_4.png');


%%  Question (2)
I_t1 = imread('texture1.gif');
I_t1 = double(I_t1);

%applying Gabor filter and plot 3D plot
m_t1 = Gabor(I_t1,24,0.042,0);
figure(5);
mesh(1:size(m_t1,1),1:size(m_t1,2),m_t1);title('applying Gabor filter to texture1');
saveas(figure(5), 'results\2_1', 'png');

%applying smooth filter and plot 3D plot
m_t1_prime = smooth(m_t1,24);
figure(6);
mesh(1:size(m_t1_prime,2),1:size(m_t1_prime,1),m_t1_prime);title('applying smooth filter to texture1');
saveas(figure(6), 'results\2_2', 'png');

%scale the pixel value of m between 0-255 and plot the gray-scale image
m_t1 = m_t1*(1/max(max(m_t1)));
figure(7);
imshow(m_t1);title('gray-scale texture1 m(x,y)');
saveas(figure(7), 'results\2_3.png');

m_t1_prime = m_t1_prime*(1/max(max(m_t1_prime)));
figure(8);
imshow(m_t1_prime);title('gray-scale texture1 m’(x,y)');
saveas(figure(8), 'results\2_4.png');
