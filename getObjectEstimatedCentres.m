function objects=getObjectEstimatedCentres(objects)
    sigma=0.05;
    for i=1:length(objects)
        objects(i).estCentre(1)=normrnd(0,sigma)+objects(i).centre(1);
        objects(i).estCentre(2)=normrnd(0,sigma)+objects(i).centre(2);
    end

end