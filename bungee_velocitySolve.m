function [solutions] = bungee_velocitySolve(valuesMap)

% disp('DEBUG: velocitySolve');

% each row represents a list of dependancies that is sufficient to solve for the value
deplist = ...
{{'length', 'initialLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN', 'modulus'} ...
};

solutions = [];

% if no nan's in the first dependancy list
nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0

% disp('DEBUG: velocitySolve Solution1');

% v= v(2gL_cm- (2L_0)/m ?_0^e¦?sA de?)


jumperMass = valuesMap('jumperMass');
cordMass = valuesMap('cordMass');
mass = jumperMass + cordMass;

area = valuesMap('area');

initialLength = valuesMap('initialLength');

length = valuesMap('length');
% need distance to center of Mass, not to jumper
lengthCM = (length * (jumperMass + 0.5*cordMass)) / mass;

strain = (length / initialLength) - 1;

elasticEnergy = bungee_elasticEnergy(strain, valuesMap);

% DEBUG
debug = false;

if debug
disp('Length:');
disp(length);

disp('Left:');
disp(2*9.81*lengthCM);

disp('Right:');
disp(2*initialLength*area*elasticEnergy/mass);

disp('Elastic Energy:');
disp(elasticEnergy);
end
%

velocity2 = 2*9.81*lengthCM - (2*initialLength*area*elasticEnergy / mass);
velocity = sign(velocity2)*sqrt(abs(velocity2));

solution_1 = velocity;

solutions = [solutions solution_1];

end

end