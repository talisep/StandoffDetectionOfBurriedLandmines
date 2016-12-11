
function [R,a,b,c,beta_0,alpha_0] = create_surf_fit(beta, alpha, r ,expected_height,R0)

%% Fit: 'untitled fit 1'.
[xData, yData, zData] = prepareSurfaceData( beta, alpha, r );

c= -1/expected_height;
alpha_0= -asin(expected_height/R0);

% Set up fittype and options.
ft = fittype( (['1/(a*cos(x+e)+b*sin(x+e)*cos(y+' num2str(alpha_0) ')+' num2str(c) '*sin(y+' num2str(alpha_0) ')*sin(x+e))']), 'independent', {'x', 'y'}, 'dependent', 'z' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 pi/2];

% Fit model to data.
[fitresult, ~] = fit( [xData, yData], zData, ft, opts );

% Plot fit with data.
figure(1);
h = plot( fitresult, [xData, yData], zData );
legend( h, 'fit', 'r vs. beta, alpha', 'Location', 'NorthEast' );
% Label axes
xlabel( 'beta[rad]' );
ylabel( 'alpha[rad]' );
zlabel( 'r[m]' );
grid on
view( 19.5, -4.0 );


[fitresult, ~] = fit( [xData, yData], zData, ft, opts );

val = coeffvalues(fitresult);
a = val(1)
b = val(2)
beta_0 = val(3);
R = @(beta,alpha)(1./(a.*cos(beta+beta_0)+b.*sin(beta+beta_0).*cos(alpha+alpha_0)+c.*sin(alpha+alpha_0).*sin(beta+beta_0)));

