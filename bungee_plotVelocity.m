function bungee_plotVelocity(valuesMap)

% plot velocity as function of length

deplist = ...
{{'initialLength', 'maxLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN', 'modulus'} ...
};

nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0


% TODO: Go to max velocity, not max length?

samples = 40;

initialLength = valuesMap('initialLength');
maxLength = valuesMap('maxLength');

velocityList = zeros(samples, 1);
lengthList = linspace(initialLength, maxLength, samples);

for ii = 1:samples
valuesMap('length') = lengthList(ii);

valuesMap('velocity') = bungee_velocitySolve(valuesMap);
velocityList(ii) = valuesMap('velocity');
end

figure
plot(lengthList, velocityList, 'black', 'LineWidth', 2);
title('Velocity Curve');
xlabel('Length');
ylabel('Velocity');

end

end
