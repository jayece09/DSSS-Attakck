function optimal_dsss()


%Initialisation
alice_cord_x=0;
alice_cord_y=0;

bob_cord_x=0;
bob_cord_y=10;

eve_cord_x=4;
eve_cord_y=-15;

%Step size
%% We shall be varying this to study various capture strategies
beta_b=1;
beta_e=1;
alpha=2;
Es= 45;% FIRST ROUD TEST= 47; %Power of source in dbm
P_alice=(10^(Es/10))/1000; 

count=0;
threshold=1000;

chip_bandwidth= 100*10^6; %bits/sec
c_light=3*10^8; %m/s

%% Sequence Initialisation
pnSequence2 = comm.PNSequence('Polynomial','x^5+x^2+1', ...
    'InitialConditions',[0 0 0 1 0],'SamplesPerFrame',31);
x3 = pnSequence2();

%% While count, i.e,  chase time is less than
while count<=threshold && (pdist([0,0;bob_cord_x,bob_cord_y])<100) % Need to figure out where to put this
    d_ae=pdist([0,0;eve_cord_x,eve_cord_y]);
    d_ab=pdist([0,0;bob_cord_x,bob_cord_y]);
    d_be=pdist([bob_cord_x,bob_cord_y;eve_cord_x,eve_cord_y]);
    %% Initialization
    if count==0
        % Actual measurements
      P_eve_alice=P_alice*(d_ae)^-alpha;
      P_eve_bob=P_bob*(d_be)^-alpha;
      % Eve knows know distance d_ae and d_be but not their coordinates.
      
      %% Path differnece
      % Since accurate path difference cannot be calculted the upper bound
      % is calculated
      path_upper_bound= 2*min(d_ae,d_be);
      % No of configuration needed= chip equivalent travlled in this time
      n_chip= ceil(path_upper_bound*chip_bandwidth/c_light);
      
      for n=1:n_chip
      
      % Effective Cross-Correlation
    end
    
    
% Alice Tranmists> Eve measures




%% Strategy after boundary is reached
% There can be two cases:  1. Boundary is perfectly circular  2. Boundary
% can be relaxed out of uncertainty


end




end
