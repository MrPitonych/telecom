close all;
ts=0.01 % ������ ������� �������������
t = 0:ts:2*pi; 
N = 512;
f0 = 10;
% �������� ������
y = sin(2*f0*pi*t);
plot(t(1:200),y(1:200)) 
grid
% ������ ��������� �������
figure
plot(abs(fft(y, N)))
