function [solutions] = bungee_modulusSolve(valuesMap)

% disp('DEBUG: modulusSolve');

% each row represents a list of dependancies that is sufficient to solve for the value
deplist = ...
{{'initialLength', 'equilibriumLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN'}; ...
};

solutions = [];

% if no nan's in the first dependancy list
nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0

% disp('DEBUG: modulusSolve Solution1');

% L_e=L_0 ( mg/EA+K(mg/EA)^n+1)


initialLength = valuesMap('initialLength');
equilibriumLength = valuesMap('equilibriumLength');

jumperMass = valuesMap('jumperMass');
cordMass = valuesMap('cordMass');

weight = 9.81 * ( jumperMass + cordMass );

area = valuesMap('area');

paramK = valuesMap('paramK');
paramN = valuesMap('paramN');

syms y;
solution_1 = solve( (weight / (area * y)) + ...
               paramK*(weight / (area * y)).^paramN ...
               + 1 == (equilibriumLength / initialLength), y, 'PrincipalValue', true, 'Real', true);
solution_1 = double(solution_1);

solutions = [solutions solution_1];

end


end