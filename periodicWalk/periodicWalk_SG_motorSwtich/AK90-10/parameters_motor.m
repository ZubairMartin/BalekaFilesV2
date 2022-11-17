%% AK70-10 Gearbox
T = 6e-3; % m
N = 9; % gear ratio

% Ring Gear Parameters
Ring.RGB = [1.0 1.0 1.0];
Ring.R = 72e-3; % m
Ring.Width = 4.5e-3; % m

% Sun Gear Parameters
Sun.RGB = [1.0 1.0 1.0];
Sun.R = Ring.R / (N*(1-1/N));
Sun.MoI = [0 0 1]; % [Lxx Lyy Lzz] gmm^2

% Planet Gear Parameters
Planet.RGB = [1.0 1.0 1.0];
Planet.R = (Ring.R-Sun.R)/2;
Planet.MoI = [0 0 1]; % [Lxx Lyy Lzz] gmm^2 (Degenerate mass otherwise...)

% Gear Carrier Parameters
Carrier.L = Sun.R + Planet.R;

% Rotor Parameters
Rotor.color = [1.0 1.0 1.0 1.0]; % RGBA
Rotor.MoI = [0 0 181877]; % [Lxx Lyy Lzz] gmm^2
