function newBungeeData = bungeecalc(bungeeData)

disp('Calculating Values...');

% TEMP
% min total solution sample:
% bungeeData.area = pi*(0.008^2) % 0.016 diam
% bungeeData.initialLength = 60
% bungeeData.cordMass = 4
% bungeeData.jumperMass = 70
% bungeeData.modulus = 5e6
% bungeeData.paramK = 0.2
% bungeeData.paramN = 5
% yields:
% bungeeData.equilibriumLength = 
% bungeeData.maxVelocity =
% bungeeData.maxLength =


inputsMap = containers.Map(fieldnames(bungeeData), struct2cell(bungeeData));

% 'Naive', easy way to handle dependancies that can be resolved
%   (that is, some variables must be solved before others so they can be
%   used)
% just keep solving missing variables until nothing changes
% instead of more complicated recursive queueing of dependancies
%  which would require a lot of data access as well
noChange = false;
while ~noChange

  valuesListOld = values(inputsMap);
  
  % Solve every variable that has the value of 'NaN'
  for var = keys(inputsMap)
    if isnan(inputsMap(var{:}))
      % call variable's unique solve function
      handle = eval(['@bungee_' var{:} 'Solve']);
      
      % we can have a result for each formula used
      results = handle(inputsMap);
      % just grab the first one for now
      if ~isempty(results)
        % disp(var{:}); % DEBUG
        % disp(results); % DEBUG
        inputsMap(var{:}) = results(1);
      end
      
      % results specific logic here if added
      % (e.g. percent difference between results to help
      %  check input values)
      
      % check if different solution values aren't very similar
      s = size(results, 2);
      if s > 1
         disp(s);
         for i = 1:(s-1)
            relativeDifference = abs( (results(i+1) - results(i)) / results(i));
            if relativeDifference >= 0.05
                  disp('Warning: Input values may not be accurate.');
            end
         end
      end

    end
  end
  
  % If we haven't successfully set a new value, break
  % because we can't solve any more
  if isequalwithequalnans(valuesListOld, values(inputsMap))
    noChange = true;
  end

end

% handle more special logic here
  % (e.g. Nothing could be solved, output specific message)

% couple of example checks
if inputsMap('maxLength') < inputsMap('initialLength');
    disp('Warning: Input values may not be accurate.');
end
if inputsMap('equilibriumLength') < inputsMap('initialLength');
    disp('Warning: Input values may not be accurate.');
end


newBungeeData = cell2struct(values(inputsMap), keys(inputsMap), 2);

end
