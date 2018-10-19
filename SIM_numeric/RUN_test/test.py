execfile("Modified_data/numeric_rocket.dr")
trick.TMM_reduced_checkpoint(0)
dyn_integloop.getIntegrator(trick.Runge_Kutta_4, 3)

# The ground is a 1000 meters above sea level.
dyn.groundAltitude = 0

dyn.rocket.thrust = 10000

# Burn fuel
fuelGone = trick.new_event("fuelGone")
fuelGone.condition(0, "trick.exec_get_sim_time() >= 20.0")
fuelGone.action(0, "dyn.rocket.mdot = 0.0");
fuelGone.action(1, "dyn.rocket.thrust = 0.0");
fuelGone.action(2, "print \"Fuel Burned.\"");
fuelGone.set_cycle(1.0)
fuelGone.activate()
trick.add_event(fuelGone)

deployChute = trick.new_event("deployChute")
deployChute.condition(0, "trick.exec_get_sim_time() >= 70.0")
deployChute.action(0, "dyn.rocket.Cd = -0.72");
deployChute.action(1, "dyn.rocket.area = 14.0");
deployChute.action(2, "print \"Chute Deployed.\"");
deployChute.set_cycle(1.0)
deployChute.activate()
trick.add_event(deployChute)

# Enable Monte Carlo.
trick.mc_set_enabled(1)

# Sets the number of runs to perform to 20. Trick will not exceed the number of values in an input file.
trick.mc_set_num_runs(100)

# Create and add a new Monte Carlo File variable to the simulation.
mcvar_thrust_force = trick.MonteVarRandom("dyn.rocket.thrust", trick.MonteVarRandom.GAUSSIAN, "kg.m/s2")

# Set the random number generator seed.
mcvar_thrust_force.set_seed(1)

#set the standard deviation for this bellcurve.
mcvar_thrust_force.set_sigma(1000)

# Set the center of the bellcurve.
mcvar_thrust_force.set_mu(10000)

# Set the maximum and minimum values to be generated.
mcvar_thrust_force.set_max(12000)
mcvar_thrust_force.set_min(8000)

# The maximum and minimum are absolute values, not relative to mu.
mcvar_thrust_force.set_min_is_relative(False)
mcvar_thrust_force.set_max_is_relative(False)

# Add the variable.
trick_mc.mc.add_variable(mcvar_thrust_force)


trick.stop(1000)
