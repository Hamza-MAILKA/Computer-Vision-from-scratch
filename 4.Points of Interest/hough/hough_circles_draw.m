function hough_lines_draw(img, centers,radius)
    figure();
    imshow(img);
    hold on;
    for i = 1 : size(centers, 1)
        center_x = centers(i, 2);
        center_y = centers(i, 1);
        theta = linspace(0, 2 * pi, 360);
        x = center_x + radius * cos(theta);
        y = center_y + radius * sin(theta);
        plot(x, y,'g', 'LineWidth', 2);
    end
end
