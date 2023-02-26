% ****CHALLENGE CSAGV***** %
% ****CIRO ARENA P38/53***** %

close all

%% Plot
figure(1)
plot(out.t,out.position)
grid on
title('position')
xlabel("t")
ylabel("p (m)")

figure(2)
plot(out.t,out.velocity)
grid on
title('velocity')
xlabel("t")
ylabel("v (m/s)")

figure(3)
plot(out.t,out.elevation)
grid on
title('Altitude')
xlabel("t")
ylabel("m")

figure(4)
plot(out.t,out.slope)
grid on
title('Slope')
xlabel("t")
ylabel("rad")

figure(5)
plot(out.t,out.input)
grid on
title('Propulsion torque')
xlabel("t")
ylabel("Nm")
ylim([-50 550])