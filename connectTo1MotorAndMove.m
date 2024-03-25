clear all; close all; clc

%%
a = arduino();

s0 = servo(a, 'D3');
s1 = servo(a, 'D4');

%% 
% Matrix to hold current motor position
% Col 1 = position in Degrees col 2 = Position in %
% Row 1 is right motor, motor0, row 2 is left motor, motor 1
currentPositions = zeros(2);
[currentPositions(1,1), currentPositions(1,2)] = extractPositions(s0);
[currentPositions(2,1), currentPositions(2,2)] = extractPositions(s1);

%%

currentPositions = rotateToKnownAmount(s0, s1, currentPositions);


%%
positionAtRotation = zeros(180,4);
positionAtRotation(:,1) = (1:180)';
for i = 1:180
    rotation = i/180;
    positionAtRotation(i,2) = rotation;
    if i == 1
        [positionAtRotation(i,3), positionAtRotation(i,4)] = moveArduinoMotor(s1, 0, rotation);
    else
        [positionAtRotation(i,3), positionAtRotation(i,4)] = moveArduinoMotor(s1, positionAtRotation(i-1,2), rotation);
    end
end

%%

motor1ninetyDeg = 0.36;
motor1oneEightyDeg = 0.88;
% Use these as the precise standards and then adjust
% for example if the user inputs 75: then 90 - x = 75, then x = 0.83*(90)
% Maybe an easier way to do this is to have a predefined function that does
% this calculation. This keeps less defined terms instead of having a conversion
% for every degree measure.


[currentPositions(1,1), currentPositions(1,2)] = moveArduinoMotor(s0, currentPositions(1,2), 0.22);% R1,C1
[currentPositions(2,1), currentPositions(2,2)] = moveArduinoMotor(s1, currentPositions(2,2), 0.88);% R1,C2
% 180 degree 
[currentPositions(1,1), currentPositions(1,2)] = moveArduinoMotor(s0, currentPositions(1,2), 0.40); % R2,C1
[currentPositions(2,1), currentPositions(2,2)] = moveArduinoMotor(s1, currentPositions(2,2), 0.36);% R2, C2
% [currentDegrees(1,1),currentDegrees(1,2)] = 
% [currentDegrees(2,1),currentDegrees(2,2)] = 
% c = disp(finalPosition);
% d = disp(finalPosition_2);
% Instead of doing this, create a function
%[s1Pos, s2Pos] = getMotorPosition(s, s2);

d = input("Enter the number of degrees: ")
