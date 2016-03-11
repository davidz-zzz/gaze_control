function drawStage(stage,objects,particles,fixation)
    
    figure(1);
    hold off;
	color=['r' 'g' 'b'];
    n=objects(1).count;
    
    for i=1:n
        plot(particles(i).positions(:,1),particles(i).positions(:,2),'MarkerEdgeColor',color(i),'MarkerFaceColor',color(i),'Marker','.','LineStyle','none')
        hold on;
        plot(objects(i).centre(:,1),objects(i).centre(:,2),'MarkerEdgeColor',color(i),'MarkerFaceColor',color(i),'Marker','+','LineStyle','none','Markersize',10,'Linewidth',3)
        hold on;
        plot(particles(i).centre(:,1),particles(i).centre(:,2),'MarkerEdgeColor',color(i),'MarkerFaceColor',color(i),'Marker','*','LineStyle','none')
        hold on;
    end

    plot(fixation.position(1),fixation.position(2),'ko')
    
    axis([0 stage.width 0 stage.height]);
end