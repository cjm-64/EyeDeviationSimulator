function [posDeg, posPercentage] = moveArduinoMotor(motor, startPos, endPos)
    
    step = 1/100;
    if startPos > endPos
        for i = startPos:-step:endPos
            writePosition(motor,i)
        end   
    else
        for i = startPos:step:endPos
            writePosition(motor,i)
        end
    end

    [posDeg, posPercentage] = extractPositions(motor);
end
