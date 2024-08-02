# CANADIAN NUCLEAR BATTERY SIMULATION PARAMETERS

# =================================================================================================================================
# PARAMETERS
# =================================================================================================================================

# MESH DENSITY TUNING --------------------------------------------------------- Notes:
rad_mesh_density = 2                                                            # density of radial divisions in unit hex
az_mesh_density = 2                                                             # MUST BE EVEN AND > 0; density of azimuthal divisions in unit hex
z_mesh_density = 5                                                              # density of height divisions
concentric_mesh_density = 2                                                     # density of radial divisions of heat pipe wall and wick
gap_mesh_density = 1                                                            # density of radial divisions of helium gap
heatpipe_mesh_density = 1                                                       # density of radial divisions in heatpipe vapor core
misc_mesh_density = 1                                                           # density of radial divisions in ctrl rod, and empty graphite hexes

# CORE ------------------------------------------------------------------------ Notes:
l_core = 1.5                                                                    # (m) height of active core
w_top_refl = 0.6                                                                # (m) top reflector thickness
w_bot_refl = 0.6                                                                # (m) bottom reflector thickness
r_outer_refl = 1.5                                                              # (m) outer radius of radial reflector
a_cell = 0.2                                                                    # (m) corner-to-corner unit cell pitch
a_zone = ${fparse a_cell * pow(3,0.5) / 8}                                      # (m) zone (around 1 fuel/1 heatpipe) pitch
w_insulation = 0.02                                                             # (m) outer core insulation thickness
w_vessel = 0.02                                                                 # (m) containment vessel thickness
r_outer_insul = ${fparse r_outer_refl + w_insulation}                           # (m) outer radius of insulation
r_outer_vessel = ${fparse r_outer_insul + w_vessel}                             # (m) outer radius of containment vessel
P_helium = 1.5e5                                                                # (Pa) helium pressure in vessel

# FUEL COMPACT ---------------------------------------------------------------- Notes:
r_compact = 0.012                                                               # (m) fuel compact radius

# HEATPIPE -------------------------------------------------------------------- Notes:
l_e = ${l_core}                                                                 # (m) evaporator length
l_a = ${fparse w_top_refl + w_insulation}                                       # (m) adiabatic section length
l_c = 0.75                                                                      # (m) condenser length
l_hp = ${fparse l_e + l_a + l_c}                                                # (m) total heatpipe length
l_hp_eff = ${fparse l_e/2 + l_a + l_c/2}                                        # (m) effective heatpipe length
w_gap = 0.0003                                                                  # (m) helium gap width
w_hx_wall = 0.002
r_vap = 0.03058                                                                 # (m) vapor core radius
r_wick = 0.03124                                                                # (m) wick (outer) radius
r_wall = 0.03175                                                                # (m) wall (outer) radius
r_gap = ${fparse r_wall + w_gap}                                                # (m) gap (outer) radius
r_hx = ${fparse r_gap + w_hx_wall}                                              # (m) heat exchanger (inner) radius
porosity = 0.6                                                                  # (ul) wick porosity

# CONTROL ROD
r_ctrlrod = 0.03175                                                             # (m) control rod (outer) radius

# TOTAL DIMENSIONS ------------------------------------------------------------ Notes:
l_total = ${fparse w_vessel + w_insulation + w_bot_refl + l_core + w_top_refl + w_insulation + l_c} # total height of reactor model
r_total = ${r_outer_vessel}                                                     # total outer radius of reactor model

# REACTOR POWER --------------------------------------------------------------- Notes:
P_core = 1.2e6                                                                  # (W) total power of core
n_fuel_cells = 522                                                              # (ul) 300 fuel pins + 222 fuel and poison pins
V_fuel_tot = ${fparse n_fuel_cells * pi * r_compact * r_compact * l_core}       # (m^3) total volume of fuel in core
q0 = ${fparse pi * P_core / (2 * V_fuel_tot)}                                   # (W/m^3) normalized power density coefficient

# SODIUM CONSTANT PROPERTIES -------------------------------------------------- Notes:
T_na_c = 2503.7                                                                 # [K] sodium critical temperature
T_na_m = 371                                                                    # [K] sodium melting point (standard conditions)
rho_na_c = 219                                                                  # [kg/m3] sodium critical density
P_na_c = 2.564e6                                                                # [Pa] sodium critical pressure

# HEAT EXCHANGER
T_2nd_in = 463                                                                  # [K] toluene inlet temperature
T_2nd_out = 643                                                                 # [K] toluene outlet temperature
T_2nd_mean = ${fparse (T_2nd_in + T_2nd_out)/2}                                 # [K] mean toluene temperature