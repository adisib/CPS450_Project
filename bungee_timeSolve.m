function [solutions] = bungee_timeSolve(valuesMap)

% disp('DEBUG: timeSolve');

% each row represents a list of dependancies that is sufficient to solve for the value
deplist = ...
{{'length', 'initialLength', 'area', 'cordMass', 'jumperMass', 'paramK', 'paramN', 'modulus'} ...
};

solutions = [];

% if no nan's in the first dependancy list
nancheck = cellfun(@(x) any(isnan(valuesMap(x))), deplist{1}, 'un', 0);
if max(cell2mat(nancheck)) == 0

% disp('DEBUG: Solve Solution1');

% t= L_0 e(2gL_0cm- (2L_0)/m ?_0^e¦?sA de?)^(-1/2)


cordArea = valuesMap('area');

initialLength = valuesMap('initialLength');

strain = (valuesMap('length') / initialLength) - 1;

cordMass = valuesMap('cordMass');
jumperMass = valuesMap('jumperMass');
mass = cordMass + jumperMass;

CMCoeff = (jumperMass + 0.5*cordMass) / mass;

elasticEnergy = bungee_elasticEnergy(strain, valuesMap);

% DEBUG
debug = false;
if debug
disp('timeSolve DEBUG:');
disp('velocity:');
disp(velocity);
disp('left:');
disp((velocity - (2*9.81*strain*CMCoeff*initialLength)).^(0.5));
disp('right:');
disp(velocity.^(0.5));
disp('-------');
end
%

velocity2 = @(x) 2*9.81*(x+1)*initialLength*CMCoeff - (2*initialLength*cordArea*elasticEnergy / mass);
vRecip = @(y) sign(velocity2(y)).*((abs(velocity2(y))).^(-0.5));

t = initialLength * integral(vRecip, 0, strain);
t = vRecip(strain);
%if t < 0
%t = 0;
%end

solution_1 = t;

if (140 >= valuesMap('length') && valuesMap('length') >= 120)
    disp('---');
    disp('Strain: ');
    disp(strain);
    disp('1/v: ');
    disp(vRecip(strain));
    disp('-');
    disp('length: ');
    disp(valuesMap('length'));
    disp('t: ');
    disp(t);
    disp('v: ');
    disp(sign(velocity2(strain))*sqrt(abs(velocity2(strain))));
end

solutions = [solutions solution_1];

end

end