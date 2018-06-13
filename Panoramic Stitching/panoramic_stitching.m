%% 3��ȫ��ƴ�� 
clc; close all;
img1 = imread('left.png');
img2 = imread('center.png');
img3 = imread('right.png');


%% surf����ƥ�估���Ƶ�Ӧ����
[l1, l2, index_pairs] = match_surf(img2, img1);
h1 = ransac(l1, l2, index_pairs)
[l1, l2, index_pairs] = match_surf(img2, img3);
h3 = ransac(l1, l2, index_pairs)
%% ͼ��ƴ��

img_p = stitch(img1, img2, img3, h1, h3);
%test(img1, img2, h1);