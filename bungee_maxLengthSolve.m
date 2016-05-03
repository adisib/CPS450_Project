function [solutions] = bungee_maxLengthSolve(valuesMap)

% disp('DEBUG: maxLengthSolve');

% each row represents a list of dependancies that is sufficient to solve for the value
deplist = ...
{{'initialLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN', 'modulus'} ...
 {'initialLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN', 'modulus'} ...
 {'initialLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN', 'modulus'} ...
};

solutions = [];

% if no nan's in the first dependancy list
nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if false % max(cell2mat(nancheck)) == 0 % Have to implement this solver properly still

% disp('DEBUG: maxLengthSolve Solution1');

% ?D_cm F?_g/(L_0 ?_0^(e_D)¦s  de)  ˜ A_0


area = valuesMap('area');
initialLength = valuesMap('initialLength');

jumperMass = valuesMap('jumperMass');
cordMass = valuesMap('cordMass');

weight = 9.81 * ( jumperMass + cordMass );

CMCoeff = (jumperMass + 0.5*cordMass) / (jumperMass + cordMass);

% syms maxLength;
% solution_1 =  solve( ( (maxLength * CMCoeff * weight) / ...
%                 (initialLength * bungee_elasticEnergy(maxLength, valuesMap)) ) ...
%                 == area, maxLength, 'PrincipalValue', true);

solutions = [solutions solution_1];

end


nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{2}, 'un', 0);
if false % max(cell2mat(nancheck)) == 0 % timeSolve doesn't seem to be correct here
    
% disp('DEBUG: maxLengthSolve Solution2');

% Really terrible and slow work-around method

initialLength = valuesMap('initialLength');

% do while - check if time increased
valuesMap('length') = 2*initialLength;
time = 1;
timePrev = 0;
while (time >= timePrev)
  maxLength = valuesMap('length');
  valuesMap('length') = valuesMap('length') + (initialLength / (2*valuesMap('length')) );
  timePrev = time;
  time = bungee_timeSolve(valuesMap);
end

solution_2 = maxLength;

solutions = [solutions solution_2];

end


nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{3}, 'un', 0);
if max(cell2mat(nancheck)) == 0
    
% disp('DEBUG: maxLengthSolve Solution3');

% Really terrible and slow work-around method

initialLength = valuesMap('initialLength');

% check if velocity increased
valuesMap('length') = 3.4*initialLength;
velocity = bungee_velocitySolve(valuesMap);
if velocity < 0
    valuesMap('length') = 3*initialLength;
    velocity = bungee_velocitySolve(valuesMap);
end
if velocity < 0
    valuesMap('length') = 2*initialLength;
    velocity = bungee_velocitySolve(valuesMap);
end
if velocity < 0
    valuesMap('length') = initialLength;
    velocity = bungee_velocitySolve(valuesMap);
end
while (velocity > 0)
  maxLength = valuesMap('length');
  valuesMap('length') = valuesMap('length') + (initialLength / (1.0 * valuesMap('length')) );
  velocity = bungee_velocitySolve(valuesMap);
end

solution_3 = maxLength;

solutions = [solutions solution_3];

end


end