
a = TrainedModel.predictFcn (diabetestraining);

avg = 0;
for i = 1:600
    if (a(i,1) == diabetestraining(i,7).label)
        avg = avg + 1;
    end
end

avg = avg / 600;
disp (avg);

a = TrainedModel.predictFcn (diabetesvalidation);

avg = 0;
for i = 1:100
    if (a(i,1) == diabetesvalidation(i,7).label)
        avg = avg + 1;
    end
end

avg = avg / 100;
disp (avg);