function objects=initObjects(n,stage)
    objects.count=n;
    for i=1:n;
        objects(i).centre=(rand(1,2)*0.6+0.2).*[stage.width stage.height];
    end
end