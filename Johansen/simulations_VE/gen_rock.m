function [rock] = gen_rock(realization, G)

    %r = load(sprintf('data_100_100_11/rock/rock_%d.mat', realization));
    r = load(sprintf('E:/Placement-Control-Optim-CO2/data_100_100_11/rock/rock_%d.mat', realization));
    p = r.poro(:);
    K = 10.^r.perm(:);  
    
    rock.perm = bsxfun(@times, [1 1 0.1], K(G.cells.indexMap)).*milli*darcy;
    rock.poro = p(G.cells.indexMap);
    clear p K;

end