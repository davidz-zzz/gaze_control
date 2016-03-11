function particles=getParticleCentre(particles)
    for i=1:length(particles)
        positions=particles(i).positions;
        coeff=pca(positions);
        rot=positions*coeff;
        positions=rot(:,1)*coeff(:,1)';
        particles(i).centre=mean(positions,1);
    end
end