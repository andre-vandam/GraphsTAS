classdef NeatPlot
    % This Class allows one to plot intercepted values on graphs, threshho-
    % ld lines, define legend, and save plot. It is designed specifically
    % for the B7 TAS 2017 project. Made by Geoffrey G, yo mama <3
    properties(SetAccess = private)
        X_VAL % x-axis values in the form of row array. [x1, x2, x3, x4,..]
        Y_VAL % y-axis values in the form of row array. [y1, y2, y3, y4,..]
        WINDO % Window domain [x0,x1,y0,y2] if specified. CONDITIONAL INPUT
        LINES % Lines for comparitive thresholds. ------[[x0,0];
        INTER % Interpolation at [x, 0] or [0, y].Same-> [x1,0]]
        LEGEN % Legend string labels in the order of [X, Y,[LINES],[INTER]]
        TITLE % TITLEame to save plot as.
        FIGUR % Figure object saved within the plot class.
        SCALE % SCALE for image scaling.
        SAVEN % Save name in directory of .m file.
        AXESL % Axis labels in the form of ["x-label","y-label"]
    end
    methods
        function obj = NeatPlot( X_VAL ,...
                                 Y_VAL ,...
                                 WINDO ,...
                                 LINES ,...
                                 INTER ,... 
                                 LEGEN ,...
                                 TITLE ,...
                                 SCALE ,...
                                 AXESL ,...
                                 SAVEN)
            obj.X_VAL = X_VAL;
            obj.Y_VAL = Y_VAL;
            obj.WINDO = WINDO;
            obj.LINES = LINES;
            obj.INTER = INTER;
            obj.LEGEN = LEGEN;
            obj.TITLE = TITLE;
            obj.SCALE = SCALE;
            obj.SAVEN = SAVEN;
            obj.AXESL = AXESL;
            %% START OF FIGURE PLOT
            obj.FIGUR = figure;
            w = obj.SCALE(1); h = obj.SCALE(2);
            set(obj.FIGUR, 'Position', [333 333 w*340 h*302])
            hold on            
            g3 = plot(obj.X_VAL, obj.Y_VAL,...
                'LineWidth',1.5,...
                'LineStyle','-',...
                'Color', [0 0 0]);
                 if isempty(obj.WINDO)==1 % Default 10% domain extra
                xlim([min(obj.X_VAL)*1.1 max(obj.X_VAL)*1.1])
                ylim([min(obj.Y_VAL)*1.1 max(obj.Y_VAL)*1.1])
            else % Domain as specified
                xlim([obj.WINDO(1) obj.WINDO(2)])
                ylim([obj.WINDO(3) obj.WINDO(4)]) 
            end
            xlabel(obj.AXESL(1),'FontSize',12,...
                                'FontWeight','normal',...
                                'FontName','Times New Roman',...
                                'Color','k');
            ylabel(obj.AXESL(2),'FontSize',12,...
                                'FontWeight','normal',...
                                'FontName','Times New Roman',...
                                'Color','k');
            title(obj.TITLE,    'FontSize',13,...
                                'FontWeight','bold',...
                                'FontName','Times New Roman',...
                                'Color','k');
            grid on
            grid minor
            %% PLOTTING THRESHOLD LINES
            if isempty(obj.LINES)==0
                for i=1:length(obj.LINES(:,1))
                    if obj.LINES(i,1)==0
                        plot([obj.WINDO(1),     obj.WINDO(2)],...
                             [obj.LINES(i,2), obj.LINES(i,2)],... 
                        'LineWidth', 1 ,...
                        'LineStyle','--',...
                        'Color', [1 0 0])
                    elseif obj.LINES(i,2)==0
                        plot([obj.LINES(i,1), obj.LINES(i,1)],...
                             [obj.WINDO(3),     obj.WINDO(4)],... 
                        'LineWidth', 1 ,...
                        'LineStyle','--',...
                        'Color', [1 0 0])
                    end
                end
            end
            %% PLOTTING INTERSECTIONS % NOTE FOR PERSONAL ONLY POS QUAD
            % This is because of the interp assuming window values.
            if isempty(obj.INTER)==0
                for i=1:length(obj.INTER(:,1))
                    if obj.INTER(i,1)==0
                        y_int = obj.INTER(i,2);
                        x_int = interp1(obj.Y_VAL, obj.X_VAL, y_int);
                        plot([obj.WINDO(1), x_int],...
                             [y_int,        y_int],... 
                        'LineWidth', 0.5 ,...
                        'LineStyle','--',...
                        'Color', [1 0 0])
                        plot([x_int,        x_int],...
                             [obj.WINDO(3), y_int],... 
                        'LineWidth', 0.5 ,...
                        'LineStyle','--',...
                        'Color', [1 0 0])
                    end
                    if obj.INTER(i,2)==0
                        x_int = obj.INTER(i,1);
                        y_int = interp1(obj.X_VAL, obj.Y_VAL, x_int);
                        plot([x_int,        x_int],... 
                             [obj.WINDO(3), y_int],...
                            'LineWidth', 0.5 ,...
                            'LineStyle','--',...
                            'Color', [1 0 0]);
                        plot([obj.WINDO(1), x_int],...
                             [y_int,        y_int],... 
                        'LineWidth', 0.5 ,...
                        'LineStyle','--',...
                        'Color', [1 0 0]);
                    end
                    plot(x_int,y_int,...
                         'Color',[1 0 0],...
                         'Marker','o',...
                         'MarkerSize',4)
                end
            end
         hold off
         legend(g3, obj.LEGEN)
         end
         function SavePlot(obj) % Method to save file to directory.
         print(obj.FIGUR,sprintf(obj.SAVEN),'-dpng','-r600')
         end

    end
    ...
end

