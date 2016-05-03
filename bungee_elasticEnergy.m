function [solutions] = bungee_elasticEnergy(strain, valuesMap)

% number of sample points to integrate with
samples = 45;

% disp('DEBUG: elasticEnergy');

% each row represents a list of dependancies that is sufficient to solve for the value
deplist = ...
{{'paramK', 'paramN', 'modulus'} ...
};

solutions = [];

nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0

% jumperMass = valuesMap('jumperMass');
% cordMass = valuesMap('cordMass');
% mass = jumperMass + cordMass;

modulus = valuesMap('modulus');
paramN = valuesMap('paramN');
paramK = valuesMap('paramK');

syms sigma;
stress = solve( (sigma / modulus) + ...
           paramK*(sigma / modulus).^paramN ...
           == strain, sigma, 'PrincipalValue', true, 'Real', true);
           
maxStress = double(stress);

stressList = linspace(0, maxStress, samples);
strainList = zeros(samples, 1);

for ii = 1:samples
strainList(ii) = (stressList(ii) / modulus) + paramK*(stressList(ii) / modulus).^paramN;
end

% integrate via composite trapezoid rule using the samples
% this will give an approximation lower than the true solution, due to concavity
% this is good; assuming the rope pulls less gives safer distance estimate for jumper
solution = trapz(strainList, stressList);

solutions = [solutions solution];

end

end