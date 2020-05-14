clc;clear all; close all
%%
%part 1
% create a 256-point sinusoidal of freq theta
theta_1 = pi/4;
x1 = zeros(256,1);
for n = 0:255;
m = n+1;
x1(m) = cos (theta_1 * n);
end
figure(1); stem(x1)
title('x1(n)')

% now for x2 use theta = pi / 2;
theta_2 = pi/2;
x2 = zeros(256,1);
for n = 0:255;
m = n+1;
x2(m) = cos (theta_2 * n);
end
figure(2); stem(x2)
title('x2(n)')

% now for x3 use theta = pi * 3/4;
x3 = zeros(256,1);
theta_3 = 3 * pi/4;
for n = 0:255;
m = n+1;
x3(m) = cos (theta_3 * n);
end
figure(3); stem(x3)
title('x3(n)')

%sum of all the sequences
for n = 0:255;
m = n+1;
xt(m) = x1(m) + x2(m)+ x3(m);
end
figure(4); stem(xt)
title('xt(n)')

%impulse with 255 zeros and d(10) = 1
d = zeros(256,1);
d(10) = 1;
figure(5); stem(d)
title('impulse')

%fft of x1
x1_fft = fft(x1);
figure(6)
stem(abs(x1_fft))
axis([0,127,0,140]);
title('fft of x1')

%fft of x2
x2_fft = fft(x2);
figure(7)
stem(abs(x2_fft))
axis([0,127,0,140]);
title('fft of x2')

%fft of x3
x3_fft = fft(x3);
figure(8)
stem(abs(x3_fft))
axis([0,127,0,140]);
title('fft of x3')

%fft of xtn
xt_fft = fft(xt);
figure(9)
stem(abs(xt_fft))
axis([0,127,0,140]);
title('fft of xt(n)')

%fft of d(n)
d_fft = fft(d);
figure(10)
stem(abs(d_fft))
axis([0,127,0,2]);
title('fft of d(n)')

%%
%Part 2 y(n) = x(n) + 2 * x(n-1) + x(n-2) + 0.8 * y(n-1) - 0.64 * y(n-2);
%calculate system response to d(n) part 2 e)
x = d;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) + 2 * x(n-1) + x(n-2) + 0.8 * y(n-1) - 0.64 * y(n-2);
end
y2 = y;
figure; stem(y2)
title('response to d(n)')


%difference equation with x1 input. part f);
x = x1;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) + 2 * x(n-1) + x(n-2) + 0.8 * y(n-1) - 0.64 * y(n-2);
end
y3 = y;
figure; stem(y3)
title('response to x1')

% also part f)
%256 point output dft of x1 input with first 128
y3_dft = fft(y3);
figure; stem(abs(y3_dft))
axis([0,127,-100,1000])
title('response to dft x1 input')

%difference equation with x2;
x = x2;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) + 2 * x(n-1) + x(n-2) + 0.8 * y(n-1) - 0.64 * y(n-2);
end
y4 = y;
figure; stem(y4)
title('response to x2')


%difference equation with x3;
x = x3;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) + 2 * x(n-1) + x(n-2) + 0.8 * y(n-1) - 0.64 * y(n-2);
end
y5 = y;
figure; stem(y5)
title('response to x3')

%difference equation with xt;
x = xt;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) + 2 * x(n-1) + x(n-2) + 0.8 * y(n-1) - 0.64 * y(n-2);
end
y6 = y;
figure; stem(y6)
title('response to xt(n)')
%%
%part g)
%256 point output dft of x2 input
y4_dft = fft(y4);
figure; stem(abs(y4_dft))
axis([0,127,-100,1000])
title('response to dft x2 input')

%part h)
%256 point output dft of x3 input
y5_dft = fft(y5);
figure; stem(abs(y5_dft))
axis([0,127,-100,1000])
title('response to dft x3 input')

%part i)
%256 point output dft of xt input with first 128
y6_dft = fft(y6);
figure; stem(abs(y6_dft))
axis([0,127,-100,1000])
title('response to dft xt input')

%%
%calculate system response to d(n) II.2 part e)
x = d;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - 2*x(n-1) + x(n-2) + 0.8 * y(n-1) - 0.64 * y(n-2);
end
y7 = y;
figure; stem(y7)
title('response to d(n) II.2')

%difference equation with x1 input. II.2 part f);
x = x1;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - 2*x(n-1) + x(n-2) + 0.8 * y(n-1) - 0.64 * y(n-2);
end
y8 = y;
figure; stem(y8)
title('response to x1 II.2')

% also part f)
%256 point output dft of x1 input with first 128
y8_dft = fft(y8);
figure; stem(abs(y8_dft))
axis([0,127,-100,1000])
title('response to dft x1 input II.2')

%difference equation with x2 II.2 part g)
x = x2;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - 2*x(n-1) + x(n-2) + 0.8 * y(n-1) - 0.64 * y(n-2);
end
y9 = y;
figure; stem(y9)
title('response to x2 II.2')

%256 point output dft of x2 input II.2
y9_dft = fft(y9);
figure; stem(abs(y9_dft))
axis([0,127,-100,1000])
title('response to dft x2 input II.2')

%difference equation with x3 II.2 part h)
x = x3;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - 2*x(n-1) + x(n-2) + 0.8 * y(n-1) - 0.64 * y(n-2);
end
y10 = y;
figure; stem(y10)
title('response to x3 II.2')

%256 point output dft of x3 input II.2
y10_dft = fft(y10);
figure; stem(abs(y10_dft))
axis([0,127,-100,1000])
title('response to dft x3 input II.2')

%difference equation with xt;
x = xt;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - 2*x(n-1) + x(n-2) + 0.8 * y(n-1) - 0.64 * y(n-2);
end
y11 = y;
figure; stem(y11)
title('response to xt(n) II.2')

%256 point output dft of xt input II.2
y11_dft = fft(y11);
figure; stem(abs(y11_dft))
axis([0,127,-100,1000])
title('response to dft xt input II.2')

%%
%Part II.3 x(n) - x(n-2) + 0.8y(n-1)-0.64y(n-2)
%calculate system response to d(n) II.3 part e)
x = d;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - x(n-2) + 0.8*y(n-1)-0.64*y(n-2);
end
y12 = y;
figure; stem(y12)
title('response to d(n) II.3')

%difference equation with x1 input. II.3 part f);
x = x1;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - x(n-2) + 0.8*y(n-1)-0.64*y(n-2);
end
y13 = y;
figure; stem(y13)
title('response to x1 II.3')

% also part f)
%256 point output dft of x1 input with first 128
y13_dft = fft(y13);
figure; stem(abs(y13_dft))
axis([0,127,-100,1000])
title('response to dft x1 input II.3')

%difference equation with x2 II.3 part g)
x = x2;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - x(n-2) + 0.8*y(n-1)-0.64*y(n-2);
end
y14 = y;
figure; stem(y14)
title('response to x2 II.3')

%256 point output dft of x2 input II.3
y14_dft = fft(y14);
figure; stem(abs(y14_dft))
axis([0,127,-100,1000])
title('response to dft x2 input II.3')

%difference equation with x3 II.3 part h)
x = x3;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - x(n-2) + 0.8*y(n-1)-0.64*y(n-2);
end
y15 = y;
figure; stem(y15)
title('response to x3 II.3')

%256 point output dft of x3 input II.3
y15_dft = fft(y15);
figure; stem(abs(y15_dft))
axis([0,127,-100,1000])
title('response to dft x3 input II.3')

%difference equation with xt II.3;
x = xt;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - x(n-2) + 0.8*y(n-1)-0.64*y(n-2);
end
y16 = y;
figure; stem(y16)
title('response to xt(n) II.3')

%256 point output dft of xt input II.3
y16_dft = fft(y16);
figure; stem(abs(y16_dft))
axis([0,127,-100,1000])
title('response to dft xt input II.3')

%%
%Part II.4 x(n) - x(n-2) + 0.2y(n-1)-0.04y(n-2)
%calculate system response to d(n) II.4 part e)
x = d;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - x(n-2) + 0.2*y(n-1)-0.04*y(n-2);
end
y17 = y;
figure; stem(y17)
title('response to d(n) II.4')

%difference equation with x1 input. II.4 part f);
x = x1;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - x(n-2) + 0.2*y(n-1)-0.04*y(n-2);
end
y18 = y;
figure; stem(y18)
title('response to x1 II.4')

% also part f)
%256 point output dft of x1 input with first 128
y18_dft = fft(y18);
figure; stem(abs(y18_dft))
axis([0,127,-100,1000])
title('response to dft x1 input II.4')

%difference equation with x2 II.4 part g)
x = x2;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - x(n-2) + 0.2*y(n-1)-0.04*y(n-2);
end
y19 = y;
figure; stem(y19)
title('response to x2 II.4')

%256 point output dft of x2 input II.4
y19_dft = fft(y19);
figure; stem(abs(y19_dft))
axis([0,127,-100,1000])
title('response to dft x2 input II.4')

%difference equation with x3 II.4 part h)
x = x3;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - x(n-2) + 0.2*y(n-1)-0.04*y(n-2);
end
y20 = y;
figure; stem(y20)
title('response to x3 II.4')

%256 point output dft of x3 input II.4
y20_dft = fft(y20);
figure; stem(abs(y20_dft))
axis([0,127,-100,1000])
title('response to dft x3 input II.4')

%difference equation with xt II.4;
x = xt;
y = zeros(size(x));
for n = 3:(length(x))
y(n) = x(n) - x(n-2) + 0.2*y(n-1)-0.04*y(n-2);
end
y21 = y;
figure; stem(y21)
title('response to xt(n) II.4')

%256 point output dft of xt input II.4
y21_dft = fft(y21);
figure; stem(abs(y21_dft))
axis([0,127,-100,1000])
title('response to dft xt input II.4')



