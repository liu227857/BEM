function distortion(F, V, uv)
Area = FaceArea(F, V);
uvArea = FaceArea(F, uv);
AreaQuality = (uvArea/sum(uvArea)) ./ (Area/sum(Area));
Angle = FaceAngle(F, V);
uvAngle = FaceAngle(F, uv);
AngleQuality = uvAngle ./ Angle;

fprintf('-----------------------------------\n')
fprintf('mean of area distortion  = %.2e\n', mean(abs(AreaQuality - 1)) );
fprintf('SD   of area distortion  = %.2e\n',  std(abs(AreaQuality - 1)) );
fprintf('mean of angle distortion = %.2e\n', mean(abs(AngleQuality - 1)) );
fprintf('SD   of angle distortion = %.2e\n',  std(abs(AngleQuality - 1)) );
fprintf('-----------------------------------\n')
fprintf('\n')
end


function Area = FaceArea(F, V)
E12 = V(F(:,2),:) - V(F(:,1),:);
E23 = V(F(:,3),:) - V(F(:,2),:);
E31 = V(F(:,1),:) - V(F(:,3),:);
Len_E12 = sqrt(sum(E12.^2, 2));
Len_E23 = sqrt(sum(E23.^2, 2));
Len_E31 = sqrt(sum(E31.^2, 2));
s = 0.5*(Len_E12+Len_E23+Len_E31);
Area = sqrt(s.*(s-Len_E12).*(s-Len_E23).*(s-Len_E31));
end

function [Angle] = FaceAngle(F, V)
Fno = size(F, 1);
E3 = V(F(:,2),:) - V(F(:,1),:);
E1 = V(F(:,3),:) - V(F(:,2),:);
E2 = V(F(:,1),:) - V(F(:,3),:);
E1 = sqrt(sum(E1.^2, 2));
E2 = sqrt(sum(E2.^2, 2));
E3 = sqrt(sum(E3.^2, 2));
Angle = zeros(Fno, 3);
Angle(:, 1) = acos((E2.^2 + E3.^2 - E1.^2) ./ (2.*E2.*E3));
Angle(:, 2) = acos((E1.^2 + E3.^2 - E2.^2) ./ (2.*E1.*E3));
Angle(:, 3) = acos((E1.^2 + E2.^2 - E3.^2) ./ (2.*E1.*E2));
Angle = rad2deg(Angle(:));
end

