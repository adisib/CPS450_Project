function [solutions] = bungee_equilibriumLengthSolve(valuesMap)

% disp('DEBUG: equilibriumLengthSolve'); % DEBUG

% each row represents a list of dependancies that is sufficient to solve for the value
deplist = ...
{{'initialLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN', 'modulus'} ...
};

solutions = [];

% if no nan's in the first dependancy list
nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0

% disp('DEBUG: equilibriumLengthSolve Solution1'); % DEBUG

% L_e=L_0 ( mg/EA+K(mg/EA)^n+1)


weight = 9.81 * ( valuesMap('jumperMass') + valuesMap('cordMass') );

areaModulusProduct = valuesMap('area') * valuesMap('modulus');

initialLength = valuesMap('initialLength');

k = valuesMap('paramK');
n = valuesMap('paramN');


solution_1 = initialLength * ( (weight/areaModulusProduct) + k*(weight/areaModulusProduct).^n + 1 );

solutions = [solutions solution_1];

end

end