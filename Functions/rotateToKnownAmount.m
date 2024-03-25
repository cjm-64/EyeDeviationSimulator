function updatedPositions = rotateToKnownAmount(motor0, motor1, currentPositions)
    degrees = input("Enter a degree value: ");
    motor = input("Input motor number (0 = L, 1 = R): ");
    motorDegrees = convert_Motor(degrees)
    rotationAmount = deg2Rotation(motorDegrees)
    
    if motor == 0
        [currentPositions(1,1), currentPositions(1,2)] = moveArduinoMotor(motor0, currentPositions(1,2), rotationAmount);
    else
        [currentPositions(2,1), currentPositions(2,2)] = moveArduinoMotor(motor1, currentPositions(2,2), rotationAmount);
    end
    updatedPositions = currentPositions;

end
