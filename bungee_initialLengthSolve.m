function [solutions] = bungee_initialLengthSolve(valuesMap)

% disp('DEBUG: initialLengthSolve');

% each row represents a list of dependancies that is sufficient to solve for the value
deplist = ...
{{'equilibriumLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN', 'modulus'}; ...
 {'maxVelocity', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN', 'modulus'}; ...
 {'maxLength', 'area', 'jumperMass', 'paramK', 'paramN', 'modulus'} ...
};

solutions = [];

% if no nan's in the first dependancy list
nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0

% disp('DEBUG: initialLengthSolve Solution1');

% L_e=L_0 ( mg/EA+K(mg/EA)^n+1)


weight = 9.81 * ( valuesMap('jumperMass') + valuesMap('cordMass') );

areaModulusProduct = valuesMap('area') * valuesMap('modulus');

equilibriumLength = valuesMap('equilibriumLength');

k = valuesMap('paramK');
n = valuesMap('paramN');


solution_1 = equilibriumLength / ( (weight/areaModulusProduct) + k*(weight/areaModulusProduct).^n + 1 );

solutions = [solutions solution_1];

end


nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{2}, 'un', 0);
if max(cell2mat(nancheck)) == 0

% disp('DEBUG: initialLengthSolve Solution2');

% ?v_(max )= v?_e= v(2C_e gL_0cm- (2AL_0)/m ?_0^(C_e-1)¦?s de?)


maxVelocity = valuesMap('maxVelocity');

jumperMass = valuesMap('jumperMass');
cordMass = valuesMap('cordMass');

area = valuesMap('area');

weight = 9.81 * ( valuesMap('jumperMass') + valuesMap('cordMass') );

areaModulusProduct = area * valuesMap('modulus');

k = valuesMap('paramK');
n = valuesMap('paramN');

Ce = ( (weight/areaModulusProduct) + k*(weight/areaModulusProduct).^n + 1 );

CMCoeff = (jumperMass + 0.5*cordMass) / (jumperMass + cordMass);

elasticEnergy = bungee_elasticEnergy(Ce-1, valuesMap);


solution_2 = (maxVelocity*maxVelocity) / ...
              (2*Ce*9.81*CMCoeff - 2*area*elasticEnergy/(jumperMass+cordMass));

solutions = [solutions solution_2];

end


nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{3}, 'un', 0);
if max(cell2mat(nancheck)) == 0

% disp('DEBUG: initialLengthSolve Solution3');

% Really terrible and slow work-around method

% ?D_cm F?_g/(L_0 ?_0^(e_D)¦s  de)  ˜ A_0

jumperMass = valuesMap('jumperMass');
cordMass = valuesMap('cordMass');
mass = jumperMass + cordMass;

cordArea = valuesMap('area');

maxLength = valuesMap('maxLength');
maxLengthCM = (maxLength * (jumperMass + 0.5*cordMass)) / mass;

gravEnergyArea = maxLengthCM*mass*9.81/cordArea;

% check if velocity increased
initialLength = maxLength/3.4;
while (initialLength*bungee_elasticEnergy((maxLength/initialLength)-1, valuesMap) < gravEnergyArea)
  initialLength = initialLength - (initialLength / maxLength);
end
while (initialLength*bungee_elasticEnergy((maxLength/initialLength)-1, valuesMap) > gravEnergyArea)
  initialLength = initialLength + (initialLength / maxLength);
end

solution_3 = initialLength;

solutions = [solutions solution_3];

end


end