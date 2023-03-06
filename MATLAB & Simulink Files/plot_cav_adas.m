% ****CHALLENGE CSAGV***** %
% ****CIRO ARENA P38/53***** %

close all

%% Plot
figure(1)
plot(out.t,out.pos_lead)
grid on
title('position')
xlabel("t")
ylabel("p (m)")
hold on
plot(out.t,out.pos_ego)
legend('p_{lead}', 'p_{ego}')


figure(2)
plot(out.t,out.vel_lead)
grid on
title('velocity')
xlabel("t")
ylabel("v (m/s)")
hold on
plot(out.t,out.vel_ego)
legend('v_{lead}', 'v_{ego}')
ylim([-2 22])
    

it = length(out.t)-length(out.control_input);
if it ~= 0
    for i=1:it
        out.control_input(5001+i) = 0;
    end
end
figure(3)
plot(out.t,out.control_input)
grid on
title('Acceleration')
xlabel("t")
ylabel("m/s^2")
ylim([-3 3])

figure(4)
subplot(2,1,1)
plot(out.t,out.p_tilde)
grid on
title('Error')
xlabel("t")
t = '$\tilde{p}$';
ylabel(t,'interpreter','latex')
subplot(2,1,2)
plot(out.t,out.vel_rel)
grid on
xlabel("t")
ylabel("v_{rel}")
