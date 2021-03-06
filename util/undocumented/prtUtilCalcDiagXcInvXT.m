function v = prtUtilCalcDiagXcInvXT(x,C)
%v = prtUtilCalcDiagXcInvXT(x,C)
%   Calculate diag(x*C^-1*x') without calculating the entire matrix.

v = sum((x/cholcov(C)).^2,2);