function [solutions] = bungee_maxVelocitySolve(valuesMap)

% disp('DEBUG: maxVelocitySolve');

% each row represents a list of dependancies that is sufficient to solve for the value
deplist = ...
{{'initialLength', 'equilibriumLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN', 'modulus'} ...
};

solutions = [];

% if no nan's in the first dependancy list
nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0

% disp('DEBUG: maxVelocitySolve Solution1');

% ?v_(max )= v?_e= v(2C_e gL_0cm- (2AL_0)/m ?_0^(C_e-1)¦?s de?)


area = valuesMap('area');

jumperMass = valuesMap('jumperMass');
cordMass = valuesMap('cordMass');
mass = jumperMass + cordMass;

equilibriumLength = valuesMap('equilibriumLength');

initialLength = valuesMap('initialLength');
% need initial distance to center of Mass, not to jumper
initialLengthCM = (initialLength * (jumperMass + 0.5*cordMass)) / mass;

Ce = equilibriumLength / initialLength;

elasticEnergy = bungee_elasticEnergy(Ce-1, valuesMap);

gravitationalEnergy = 2*Ce*9.81*initialLengthCM;

maxVel = gravitationalEnergy - ...
             (2*area*initialLength*elasticEnergy / (mass));

solution_1 = sign(maxVel)*sqrt(abs(maxVel));
solutions = [solutions solution_1];

end

end