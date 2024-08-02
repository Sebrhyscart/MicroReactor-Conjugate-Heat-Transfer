# CANADIAN NUCLEAR BATTERY SIMULATION POST PROCESSING

import pandas as pd
import matplotlib.pyplot as plt

# STEADY STATE POST PROCESSING
csv_file = 'steady1_out.csv'
df = pd.read_csv(csv_file)

last_row = df.iloc[-1]
steady_results = last_row.to_dict()

Q_heatpipe_transfered = 0

for heatpipe in range(1,30):
    Q_evap = steady_results[f'hp{heatpipe}_evap_flux_int']
    Q_adiab = steady_results[f'hp{heatpipe}_adiab_flux_int']
    Q_cond = steady_results[f'hp{heatpipe}_cond_flux_int']
    Q_bot = steady_results[f'hp{heatpipe}_bot_flux_int']
    Q_sum = Q_evap + Q_adiab + Q_cond + Q_bot
    Q_heatpipe_transfered += Q_cond
    print("Heatpipe #" + str(heatpipe) + ": Q_evap = " + str(round(Q_evap,1)) + " (W), Q_adiab = " + str(round(Q_adiab,1)) + " (W), Q_cond = " + str(round(Q_cond,1)) + " (W), Q_bot = " + str(round(Q_bot,1)) + " (W)")

power_actual = 1.2e6 / 6
power = steady_results['power']
Q_out = steady_results['Q_dot_out_tot']
difference = power - Q_out
Q_leak = steady_results['vessel_flux_int']

T_fuel = steady_results['T_fuel_ave'] - 273.15
T_fuel_max = steady_results['T_fuel_max'] - 273.15
T_mod = steady_results['T_mod_ave'] - 273.15
T_mod_max = steady_results['T_mod_max'] - 273.15
T_vapor = steady_results['T_vap_ave'] - 273.15
T_wick = steady_results['T_wick_ave'] - 273.15

print(" === NUMERICAL DETAILS ===")
print("Number of variables: " + str(int(steady_results['num_variables'])))
print("Number of DOF: " + str(int(steady_results['num_DOF'])))
print("Radial mesh density = " + str(int(steady_results['rad_mesh_density'])))
print("Azimuthal mesh density = " + str(int(steady_results['az_mesh_density'])))
print("Axial mesh density = " + str(int(steady_results['z_mesh_density'])))
print("Vapor core mesh density = " + str(int(steady_results['heatpipe_mesh_density'])))
print("Wall/Wick mesh density = " + str(int(steady_results['concentric_mesh_density'])))
print("Gap mesh density = " + str(int(steady_results['gap_mesh_density'])))
print("Misc mesh density = " + str(int(steady_results['misc_mesh_density'])))
print("")
print(" === SIMULATION RESULTS ===")
print("Power:               P = " + str(round(power,1)) + " (W)")
print("                         error = " + str(round(abs((power - power_actual)*(100/power_actual)),2)) + " %")
print("Total heat out:      Q = " + str(round(Q_out,1)) + " (W)")
print("                         error = " + str(round(abs((Q_out - power_actual)*(100/power_actual)),2)) + " %")
print("Heatpipes transport: Q = " + str(abs(round(Q_heatpipe_transfered,1))) + " (W)")
print("heat leaked:         Q = " + str(round(Q_leak,1)) + " (W)")
print("Average fuel temp:   T = " + str(round(T_fuel,1)) + " (deg C)")
print("Max fuel temp:       T = " + str(round(T_fuel_max,1)) + " (deg C)")
print("Average mod temp:    T = " + str(round(T_mod,1)) + " (deg C)")
print("Max mod temp:        T = " + str(round(T_mod_max,1)) + " (deg C)")
print("Average vapor temp:  T = " + str(round(T_vapor,1)) + " (deg C)")
print("Average wick temp:   T = " + str(round(T_wick,1)) + " (deg C)")
print("")
print("Power - Q_out difference: " + str(round(difference,1)) + " (W)")