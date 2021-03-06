function result = prtTestpreProcPCA

result = true;

% test from the help
try
    dataSet = prtDataGenProstate;     % Load a data set.
    pca = prtPreProcPca;           % Create the Principle Component
    % Analysis object.
    pca.nComponents = 4;           % Set the number of components to 4
    pca = pca.train(dataSet);      % Compute the Principle Components
    dataSetNew = pca.run(dataSet); % Extract the Principle Components
    
catch
    result = false;
    disp('error #1, basic pca test fail')
    
end

if dataSetNew.nFeatures ~=4
    result = false;
    disp('error #2, wrong number of features')
end

% check constuctor
try
    pca = prtPreProcPca('nComponents',4);
catch
    result = false;
    disp('error #3, param-val constructor fail')
end

% Baseline check would be nice if one exists.

%% Negative error checks

error = true;

try
    pca = prtPreProcPca;
    pca.nComponents = 0;
    error = false;
    disp('error #4, set to zero components')
catch
    %
end


try
    dataSet = prtDataGenProstate;     % Load a data set.
    pca = prtPreProcPca;           % Create the Principle Component
    % Analysis object.
    pca.nComponents = 20;           % Set the number of components to 4
    pca = pca.train(dataSet);      % Compute the Principle Components
    dataSetNew = pca.run(dataSet); % Extract the Principle Components
    
catch
    
end

if ~isequal(lastwarn, 'User specified # PCA components (20) is > maximum number of PCA allowed (min(size(dataSet.data)) = 16)')
    error = false;
    disp('error#5, too many components')
end

result = result && error;

