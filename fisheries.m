load fisheriris
labels = unique(species);
disp(labels)
mdl = ClassificationDiscriminant.fit(meas,species);
predicted_species = predict(mdl,meas);
Conf_Mat = confusionmat(species,predicted_species);
disp(Conf_Mat)
colormap('hot');
imagesc(Conf_Mat);
colorbar;
xlabel('Predicted'); ylabel('Actual');