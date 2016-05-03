function bungeevis(bungeeData)

disp('Building Visuals...');

valuesMap = containers.Map(fieldnames(bungeeData), struct2cell(bungeeData));

bungee_plotStressStrain(valuesMap);

bungee_plotVelocity(valuesMap);

% bungee_plotLength(valuesMap);

end
