clear all;
close all;
figure(1);
OBJECTS_NUM=2;
PARTICLE_NUM=1000;

stage=initStage(20,10);
objects=initObjects(2,stage);
particles=initParticles(1000,stage,objects);
particles=getParticleCentre(particles);
fixation.position=[5 3];
for i=1:100;
    move=[0.5 0];
    fixation.position=fixation.position+move;
    objects=getObjectEstimatedCentres(objects);
    particles=getNewObservation(particles,objects,fixation);
    drawStage(stage,objects,particles,fixation);
    pause(1);
end


