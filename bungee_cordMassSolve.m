function [solutions] = bungee_cordMassSolve(valuesMap)

% disp('DEBUG: cordMassSolve');

% each row represents a list of dependancies that is sufficient to solve for the value
deplist = ...
{{'maxLength', 'initialLength', 'area', 'jumperMass', 'paramK', 'paramN', 'modulus'}; ...
% {'maxVelocity', 'initialLength', 'area', 'jumperMass', 'paramK', 'paramN', 'modulus'}; ...
};

solutions = [];

% if no nan's in the first dependancy list
nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0 % can't get elastic energy without mass (actually this is false? It is being requested for no reason)

% disp('DEBUG: cordMassSolve Solution1');

% ?D_cm F?_g/(L_0 ?_0^(e_D)¦s  de)  ˜ A_0


area = valuesMap('area');

initialLength = valuesMap('initialLength');
maxLength = valuesMap('maxLength');

jumperMass = valuesMap('jumperMass');

maxStrain = (maxLength / initialLength) - 1;

CMW = (area * initialLength * bungee_elasticEnergy(maxStrain, valuesMap)) / maxLength;

solution_1 = 2*((CMW / 9.81) - jumperMass);

solutions = [solutions solution_1];

end

end