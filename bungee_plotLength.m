function bungee_plotVelocity(valuesMap)

% plot length as function of time

deplist = ...
{{'initialLength', 'maxLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN', 'modulus'} ...
};

nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0


samples = 40;

initialLength = valuesMap('initialLength');
maxLength = valuesMap('maxLength');

timeList = zeros(samples, 1);
lengthList = linspace(initialLength, maxLength, samples);

for ii = 1:samples
valuesMap('length') = lengthList(ii);

valuesMap('time') = bungee_timeSolve(valuesMap);
timeList(ii) = valuesMap('time');
end

figure
plot(lengthList, timeList, 'black', 'LineWidth', 2);
title('Length Curve');
xlabel('Length');
ylabel('Time');

end

end
