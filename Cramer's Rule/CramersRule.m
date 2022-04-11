% Get User Input
prompt = "What is the file name of your test case?";

% Stores the name of the txt file
txtFile = input(prompt, "s");

% Opens the txt file
openFile = fopen(txtFile); 

% Gets all the necessary stuff from the txt file
variables = fscanf(openFile,'%f'); 

% Closes the file
fclose(openFile);

% Loop Control Variable to create Matrix A
loopControl = 2;

% Declaration to Create Matrix A
MatrixA = [];

% Creation of Matrix A by storing the txt variables into it
for i = 1:variables(1) % variables(1) is the n x n size of our array
    for j = 1:variables(1) 
        MatrixA(i,j) = variables(loopControl);
        loopControl = loopControl + 1;
    end;
end;

% Shows us Matrix A
MatrixA

% Declaration to Create Vector B
VectorB = [];

% Creation of Vector by storing the remaining txt variables into it
for i = 1:variables(1)
    VectorB(i) = variables(loopControl);
    loopControl = loopControl + 1;
end

% Shows us Vector B
VectorB

% Create a Temporary Matrix A to run Gaussian Elimination 
TempMatrixA = MatrixA;

% Gaussian Elimination on Matrix A 
for i = 1:(variables(1) - 1)
    for j = (i+1):variables(1)
        if TempMatrixA(i,i) ~= 0
            multiplicationFactor = TempMatrixA(j,i)/TempMatrixA(i,i) ;
            for k= i:variables(1)
                TempMatrixA(j,k) = TempMatrixA(j,k) - multiplicationFactor*TempMatrixA(i,k);
            end
        end
    end
end

% Shows us Matrix A after Gaussian Elimination
TempMatrixA

% Finds the determinant 
detA = 1;
for i = 1:variables(1)
    detA = detA * TempMatrixA(i,i);
end

% Prints determinant of Matrix A
detA

% Where we will be storing all our determinants
determinants = [];

% Store the first determinant into our determinants array
determinants(1) = detA;

% Runs Gaussian Elimination on Matrix A1, A2, A3, .... & finds determinant 
for w = 1:variables(1)
    
    TempMatrix = MatrixA;
    
    for i = 1:variables(1)
        TempMatrix(i,w) = VectorB(i); 
    end
    
    for i = 1:(variables(1) - 1)
        for j = (i+1):variables(1)
            if TempMatrix(i,i) ~= 0
                multiplicationFactor = TempMatrix(j,i)/TempMatrix(i,i) ;
                for k= i:variables(1)
                    TempMatrix(j,k) = TempMatrix(j,k) - multiplicationFactor*TempMatrix(i,k);
                end
            end
        end
    end
    det = 1;
    for i = 1:variables(1)
        det = det * TempMatrix(i,i);
    end
    
    determinants(w + 1) = det;
    
end

fprintf("determinant A = " + determinants(1));
fprintf('\n')

for i = 1:variables(1)
    fprintf("determinant A" + i + " = " + determinants(i + 1));
    fprintf('\n')
end

for i = 1:variables(1)
    fprintf("x" + i + " = " + determinants(i + 1)/determinants(1));
    fprintf('\n')
end



