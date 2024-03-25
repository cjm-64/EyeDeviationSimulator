function [positionDeg, positionPercent] = extractPositions(s)
    percent2Degrees = 0.0055; % percent/deg 90deg = 0.52 percent
    positionPercent = readPosition(s);
    positionDeg = positionPercent/percent2Degrees;
end
