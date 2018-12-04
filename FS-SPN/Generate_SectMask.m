
function Sect_Mask = Generate_SectMask(width, height, cen_x, cen_y, CenAng_s, CenAng_e, r_s, r_e)

    Sect_Mask = uint8(zeros(height, width));

    off_x = [1:width] - cen_x;
    off_y = -1*([1:height] - cen_y);
    
    for i = 1:width
        for j = 1:height
            r = sqrt(off_x(i)^2 + off_y(j)^2);
            alpha = ( atan2( off_y(j), off_x(i) ) )*180/pi;

            if alpha >= CenAng_s && alpha <= CenAng_e && r >= r_s && r <= r_e
                Sect_Mask(j, i) = 1;
            end
        end
    end

end