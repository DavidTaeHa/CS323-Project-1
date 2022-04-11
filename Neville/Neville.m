clear
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

y0 = Neville_helper(variables);
disp(y0);