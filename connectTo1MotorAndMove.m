clear all; close all; clc

%%
a = arduino();

s = servo(a, 'D3');
s2 = servo(a, 'D4');

%% 
motorPositionStart = readPosition(s2);
motorPositionEnd = 0;
ninetyDeg = 0.375;
oneEightyDeg = 0.895;

finalPosition = moveArduinoMotor(s2, motorPositionStart, oneEightyDeg)

