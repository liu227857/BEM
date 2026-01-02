function patchObj = plot_mesh(F, V)
Vno = size(V, 1);
e = ones(Vno, 1);
RGB = [129/255, 159/255, 247/255];
Vrgb = e*RGB;
figure
patchObj = patch('Faces', F, 'Vertices', V, 'FaceVertexCData', Vrgb,...
    'EdgeColor', 'k', 'EdgeAlpha', 0.25, 'FaceColor', 'interp');
camlight
axis equal off
end
