function particles=getNewObservation(particles,objects,fixation)

    for i=1:length(particles)
        object=objects(i);
        p=particles(i);
        
        weights=getWeight(p.positions,object.estCentre,fixation.position);
        len=p.count;
        % store new particle
        new_p=p;
        for k=1:len
            % pick up sample index
            cumulative_sum=zeros(length(weights),1);
            cumulative_sum(1)=weights(1);
            for j=2:len
               cumulative_sum(j)=weights(j)+cumulative_sum(j-1);
            end
            sum_w=sum(weights);
            sel=rand(1)*sum_w;
            for j=1:len
                if sel<cumulative_sum(j)
                    s_i=j;
                    break 
                end
            end
            % add gaussian
            dis=(object.estCentre(1)-fixation.position(1))^2+(object.estCentre(2)-fixation.position(2))^2;
            sigma=dis/400;
            new_p.positions(k,1)=mvnrnd(p.positions(s_i,1),sigma);
            new_p.positions(k,2)=mvnrnd(p.positions(s_i,2),sigma);
        end
        new_p=getParticleCentre(new_p);
        particles(i)=new_p;
    end
end
function weight=getWeight(particles,obj_pos,obs_pos)
    len=length(particles);

    obj_xs=particles(:,1)-obj_pos(1);
    obj_ys=particles(:,2)-obj_pos(2);
    
    obs_xs=obs_pos(1)-obj_pos(1);
    obs_ys=obs_pos(2)-obj_pos(2);
    
    p1=getPrediction(obj_xs);
    p2=getPrediction(obj_ys);
    p3=1-getPrediction(obs_xs);
    p4=1-getPrediction(obs_ys);
    
    
    weight=p1.*p2.*p3.*p4;
    
end
function p=getPrediction(dis)
    p=1.0;
    z_hit=0.95;
    sigma_hit=0.2;
    p=z_hit* exp(-dis.^2/(2*sigma_hit^2));
end