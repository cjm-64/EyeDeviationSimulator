function outputRotation = checkRotationBoundaries(inputRotation)
    if inputRotation < 0
        outputRotation = 0;
    elseif inputRotation > 1
        outputRotation = 1;
    else
        outputRotation = inputRotation;
    end
end