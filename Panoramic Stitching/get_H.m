function H = get_H(u, v)

if size(u, 2)~=2
    error("U should be Nx2 format");
end
if size(v, 2)~=2
    error("V should be Nx2 format");
end
if size(u, 1)~= size(v, 1)
    error("U and V should have the same dimension in the 1st dimension");
end

% ������������Ƶ�Ӧ����
% u: 4x2
% v: 4x2

A = [];
n = size(u, 1);
for i = 1 : n
    A = [A; 
        v(i, 1), v(i, 2),   1,         0,        0,    0,  -v(i, 1) * u(i, 1), -v(i, 2) * u(i, 1), -u(i, 1);
              0,       0,   0,   v(i, 1),  v(i, 2),    1,  -v(i, 1) * u(i, 2), -v(i, 2) * u(i, 2), -u(i, 2)];
end

% AH = 0;
% 8����
% 3������������
% 2����֤��
% 3����ȫ����
[U, S, V] = svd(A);
h = V(:, end);

H = [h(1:3)'; h(4:6)';h(7:9)'];
end