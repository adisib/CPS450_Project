function bungee_plotStressStrain(valuesMap)

deplist = ...
{{'initialLength', 'maxLength', 'paramK', 'paramN', 'modulus'} ...
};

nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0

samples = 50;

maxLength = valuesMap('maxLength');
initialLength = valuesMap('initialLength');
area = valuesMap('area');
modulus = valuesMap('modulus');
paramK = valuesMap('paramK');
paramN = valuesMap('paramN');

maxStrain = (maxLength / initialLength) - 1;

syms sigma;
stress = solve( (sigma / modulus) + ...
           paramK*(sigma / modulus).^paramN ...
           == maxStrain, sigma);
           
maxStress = double(stress(1));
           
stressList = linspace(0, maxStress, samples);
strainList = zeros(samples, 1);

for ii = 1:samples
strainList(ii) = (stressList(ii) / modulus) + paramK*(stressList(ii) / modulus).^paramN;
hookeanList(ii) = stressList(ii) / modulus;
end

figure
plot(strainList, stressList, 'black', 'LineWidth', 2);
hold on;
plot(hookeanList, stressList, 'blue', 'LineWidth', 0.75);
hold off;
title('Stress-Strain Curve');
xlabel('Strain');
ylabel('Stress');

end

end