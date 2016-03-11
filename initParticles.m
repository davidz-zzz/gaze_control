function particles=initParticles(n,stage,objects)
    particles.count=objects.count;

    for i=1:particles.count
        particles(i).count=n;
        particles(i).positions=rand(n,2).*repmat([stage.width stage.height],n,1);
    end
end