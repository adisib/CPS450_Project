function [solutions] = bungee_paramNSolve(valuesMap)

% disp('DEBUG: paramNSolve');

% each row represents a list of dependancies that is sufficient to solve for the value
deplist = ...
{{'initialLength', 'equilibriumLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'modulus'}; ...
};

solutions = [];

% if no nan's in the first dependancy list
nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0

% disp('DEBUG: paramNSolve Solution1');

% L_e=L_0 ( mg/EA+K(mg/EA)^n+1)


initialLength = valuesMap('initialLength');
equilibriumLength = valuesMap('equilibriumLength');

jumperMass = valuesMap('jumperMass');
cordMass = valuesMap('cordMass');

weight = 9.81 * ( jumperMass + cordMass );

maxDistance = valuesMap('maxLength');

maxDistanceCM = (maxDistance * (jumperMass + 0.5*cordMass)) / (jumperMass + cordMass);

area = valuesMap('area');

paramK = valuesMap('paramK');
mod = valuesMap('modulus');

syms paramN;
solution_1 = solve( (weight / (area * mod)) + ...
               paramK*(weight / (area * mod)).^paramN ...
               + 1 == (equilibriumLength / initialLength), paramN, 'PrincipalValue', true, 'Real', true);
solution_1 = double(solution_1);

solutions = [solutions solution_1];

end

end