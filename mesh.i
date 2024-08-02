# CANADIAN NUCLEAR BATTERY SIMULATION MESHING

# Must run with the file param.i:
#   ./cardinal-opt -i param.i mesh.i --mesh-only

# Block Key
# 1 - graphite
# 2 - fuel compact
# 3 - heat pipe evaporator wall
# 4 - heat pipe adiabatic wall
# 5 - heat pipe condenser wall
# 6 - control rod
# 7 - top reflector
# 8 - bottom reflector
# 9 - radial reflector
# 10 - thermal insulation
# 11 - reactor vessel
# 12 - helium gap
# 13 - secondary side wall
# 20 to 48 - heat pipe vapor core
# 50 to 78 - heat pipe wick
# 80 to 108 - heat pipe free liquid (if no wick in that section)
# 200 - block to be deleted in mesh generating process

# =================================================================================================================================
# MESH
# =================================================================================================================================

[Mesh]
    [fz]                                                    # Fuel compact hexagonal zone                                                         
        type = PolygonConcentricCircleMeshGenerator                        
        num_sides = 6                                            
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'              
        background_intervals = ${fparse rad_mesh_density + 2}                             
        background_block_ids = '1'                 
        polygon_size = '${a_zone}'                    
        polygon_size_style = 'apothem'                              
        ring_radii = '${r_compact}'                                           
        ring_intervals = '${rad_mesh_density}'                                   
        ring_block_ids = '2'                         
        preserve_volumes = on                                      
        quad_center_elements = true   
    []
    [gz]                                                    # Graphite (empty) hexagonal zone
        type = PolygonConcentricCircleMeshGenerator
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${misc_mesh_density}'
        background_block_ids = '9'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap}'                
        ring_intervals = '${misc_mesh_density}'                                             
        ring_block_ids = '9'
        preserve_volumes = on
        quad_center_elements = true
    []
    [cz]                                                    # Control rod hexagonal zone
        type = PolygonConcentricCircleMeshGenerator
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_ctrlrod}'                
        ring_intervals = '${misc_mesh_density}'                                             
        ring_block_ids = '6'
        preserve_volumes = on
        quad_center_elements = true
    []
    [h0]                                                    # Heat pipe hexagonal zone                                             
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                         
        ring_block_ids = '20 50 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h1]                                                    # Heat pipe hexagonal zone again - Need 29 unique block IDs so 29 different heat pipe zones :)
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                          
        ring_block_ids = '21 51 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h2]                                           
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                          
        ring_block_ids = '22 52 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h3]                                            
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                           
        ring_block_ids = '23 53 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h4]                
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                         
        ring_block_ids = '24 54 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h5]                                
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                           
        ring_block_ids = '25 55 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h6]                                     
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                         
        ring_block_ids = '26 56 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h7]                                           
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                        
        ring_block_ids = '27 57 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h8]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                          
        ring_block_ids = '28 58 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []    
    [h9]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                          
        ring_block_ids = '29 59 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h10]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                          
        ring_block_ids = '30 60 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h11]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                         
        ring_block_ids = '31 61 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h12]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                          
        ring_block_ids = '32 62 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h13]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                           
        ring_block_ids = '33 63 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h14]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                           
        ring_block_ids = '34 64 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h15]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                        
        ring_block_ids = '35 65 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h16] 
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                         
        ring_block_ids = '36 66 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h17]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                        
        ring_block_ids = '37 67 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h18] 
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                        
        ring_block_ids = '38 68 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h19]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                         
        ring_block_ids = '39 69 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h20]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                         
        ring_block_ids = '40 70 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h21]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                        
        ring_block_ids = '41 71 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h22]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                          
        ring_block_ids = '42 72 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h23]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                         
        ring_block_ids = '43 73 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h24]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                         
        ring_block_ids = '44 74 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h25]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                         
        ring_block_ids = '45 75 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h26]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                          
        ring_block_ids = '46 76 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h27]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                         
        ring_block_ids = '47 77 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [h28]
        type = PolygonConcentricCircleMeshGenerator 
        num_sides = 6
        num_sectors_per_side = '${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density} ${az_mesh_density}'
        background_intervals = '${rad_mesh_density}'
        background_block_ids = '1'
        polygon_size = '${a_zone}'
        polygon_size_style = 'apothem'
        ring_radii = '${r_vap} ${r_wick} ${r_wall} ${r_gap} ${r_hx}'   
        ring_intervals = '${heatpipe_mesh_density} ${concentric_mesh_density} ${concentric_mesh_density} ${gap_mesh_density} ${concentric_mesh_density}'                           
        ring_block_ids = '48 78 3 12 13'   
        preserve_volumes = on
        quad_center_elements = true
    []
    [core_lattice]                                          # Assembly of core hexagonal lattice
        type = PatternedHexMeshGenerator
        inputs = 'fz cz gz h0 h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14  
                  h15 h16 h17 h18 h19 h20 h21 h22 h23 h24 h25 h26 h27 h28'
        pattern_boundary = none
        external_boundary_name = external
        generate_core_metadata = false
        pattern = '2 2 2 0 0 0 0 0 0 0 0 0 0 2 2 2;
                  2 2 0 3 0 3 0 3 0 26 0 27 0 28 0 2 2;
                 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2;
                0 3 0 3 0 3 0 3 0 19 0 20 0 21 0 22 0 29 0;
               0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
              0 3 0 3 0 1 0 3 0 3 0 15 0 16 0 1 0 23 0 30 0;
             0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 3 0 3 0 3 0 3 0 3 0 10 0 11 0 12 0 17 0 24 0 31 0;
           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
          0 3 0 3 0 3 0 3 0 3 0 3 0 7 0 8 0 13 0 18 0 25 0 3 0;
         0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 3 0 3 0 3 0 3 0 3 0 3 0 4 0 5 0 9 0 14 0 3 0 3 0 3 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 
      2 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 6 0 3 0 3 0 3 0 3 0 3 2;
     2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2;
    2 2 0 3 0 1 0 3 0 3 0 3 0 3 0 1 0 3 0 3 0 3 0 3 0 1 0 3 0 2 2;
     2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2;
      2 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 2;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 
        0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0;
         0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
          0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0;
           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0;
             0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
              0 3 0 3 0 1 0 3 0 3 0 3 0 3 0 1 0 3 0 3 0;
               0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0 3 0;
                 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2;
                  2 2 0 3 0 3 0 3 0 3 0 3 0 3 0 2 2;
                   2 2 2 0 0 0 0 0 0 0 0 0 0 2 2 2'
    []
    [radial_reflector]                                      # Radial reflector around the core
        type = PeripheralRingMeshGenerator
        input = core_lattice
        input_mesh_external_boundary = 'external'
        peripheral_ring_radius = ${r_outer_refl}
        external_boundary_name = 'external1'
        peripheral_ring_block_id = 9
        peripheral_layer_num = ${fparse 6 * misc_mesh_density}
    []
    [radial_insulator]                                      # Thermal insulation layer around the radial reflector
        type = PeripheralRingMeshGenerator
        input = radial_reflector
        input_mesh_external_boundary = 'external1'
        peripheral_ring_radius = ${r_outer_insul}
        external_boundary_name = 'external2'
        peripheral_ring_block_id = 10
        peripheral_layer_num = 3
    []
    [radial_vessel]                                         # Outer reactor vessel layer around the insulator
        type = PeripheralRingMeshGenerator
        input = radial_insulator
        input_mesh_external_boundary = 'external2'
        peripheral_ring_radius = ${r_outer_vessel}
        external_boundary_name = 'external_bound'
        peripheral_ring_block_id = 11
        peripheral_layer_num = 3
    []
    [hex_trim]                                              # Cut out 1/6th of the core to simulate by symmetry arguments
        type = HexagonMeshTrimmer
        input = radial_vessel
        center_trim_starting_index = 4
        center_trim_ending_index = 6
        center_trimming_section_boundary = symmetry 
    []
    [extrude]                                               # Extrude 2D core into 3D, swap different blocks depending on region (see block key, line 6)
        type = AdvancedExtruderGenerator
        input = hex_trim
        direction = '0 0 1'
        heights = '${w_vessel} ${w_insulation} ${w_bot_refl} ${w_hx_wall} ${l_core} ${w_top_refl} ${w_insulation} ${l_c}'
        num_layers = '${z_mesh_density} ${z_mesh_density} ${fparse 2*z_mesh_density} ${z_mesh_density} ${fparse 7*z_mesh_density} ${fparse 2*z_mesh_density} ${z_mesh_density} ${fparse 3*z_mesh_density} '
        subdomain_swaps = '1 11 2 11 3 11 6 11 9 11 10 11 12 11 13 11 20 11 21 11 22 11 23 11 24 11 25 11 26 11 27 11
                           28 11 29 11 30 11 31 11 32 11 33 11 34 11 35 11 36 11 37 11 38 11 39 11 40 11 41 11 42 11
                           43 11 44 11 45 11 46 11 47 11 48 11 50 11 51 11 52 11 53 11 54 11 55 11 56 11 57 11 58 11
                           59 11 60 11 61 11 62 11 63 11 64 11 65 11 66 11 67 11 68 11 69 11 70 11 71 11 72 11 73 11
                           74 11 75 11 76 11 77 11 78 11;
                           1 10 2 10 3 10 6 10 9 10 12 10 13 10 20 10 21 10 22 10 23 10 24 10 25 10 26 10 27 10 28 10 
                           29 10 30 10 31 10 32 10 33 10 34 10 35 10 36 10 37 10 38 10 39 10 40 10 41 10 42 10 43 10
                           44 10 45 10 46 10 47 10 48 10 50 10 51 10 52 10 53 10 54 10 55 10 56 10 57 10 58 10 59 10
                           60 10 61 10 62 10 63 10 64 10 65 10 66 10 67 10 68 10 69 10 70 10 71 10 72 10 73 10 74 10
                           75 10 76 10 77 10 78 10;
                           1 8 2 8 3 8 6 8 9 8 12 8 13 8 20 8 21 8 22 8 23 8 24 8 25 8 26 8 27 8 28 8 29 8 30 8 31 8
                           32 8 33 8 34 8 35 8 36 8 37 8 38 8 39 8 40 8 41 8 42 8 43 8 44 8 45 8 46 8 47 8 48 8 50 8 
                           51 8 52 8 53 8 54 8 55 8 56 8 57 8 58 8 59 8 60 8 61 8 62 8 63 8 64 8 65 8 66 8 67 8 68 8
                           69 8 70 8 71 8 72 8 73 8 74 8 75 8 76 8 77 8 78 8; 
                           13 1 20 3 21 3 22 3 23 3 24 3 25 3 26 3 27 3 28 3 29 3 30 3 31 3 32 3 33 3 34 3 35 3 36 3
                           37 3 38 3 39 3 40 3 41 3 42 3 43 3 44 3 45 3 46 3 47 3 48 3 50 3 51 3 52 3 53 3 54 3 55 3
                           56 3 57 3 58 3 59 3 60 3 61 3 62 3 63 3 64 3 65 3 66 3 67 3 68 3 69 3 70 3 71 3 72 3 73 3
                           74 3 75 3 76 3 77 3 78 3;
                           13 1;
                           1 7 2 7 3 4 9 7 13 7 50 80 51 81 52 82 53 83 54 84 55 85 56 86 57 87 58 88 59 89 60 90 61 91 
                           62 92 63 93 64 94 65 95 66 96 67 97 68 98 69 99 70 100 71 101 72 102 73 103 74 104 75 105 76 106
                           77 107 78 108;
                           1 10 2 10 3 4 6 10 9 10 13 10 50 80 51 81 52 82 53 83 54 84 55 85 56 86 57 87 58 88 59 89 
                           60 90 61 91 62 92 63 93 64 94 65 95 66 96 67 97 68 98 69 99 70 100 71 101 72 102 73 103 
                           74 104 75 105 76 106 77 107 78 108;
                           1 200 2 200 3 5 6 200 9 200 10 200 11 200 50 80 51 81 52 82 53 83 54 84 55 85 56 86 57 87 
                           58 88 59 89 60 90 61 91 62 92 63 93 64 94 65 95 66 96 67 97 68 98 69 99 70 100 71 101 72 102 
                           73 103 74 104 75 105 76 106 77 107 78 108'
    []
    [top_core_sideset]                                      # Surface on top of core insulation
        type = SideSetsBetweenSubdomainsGenerator
        input = extrude
        primary_block = '10 11'
        paired_block = '200'
        new_boundary = 'core_top'
        replace = true
    []
    [del]                                                   # Delete block 200 
        type = BlockDeletionGenerator
        input = top_core_sideset
        block = 200
    []
    [rename_blocks]                                         # Rename blocks to clear(er) names (see block key, line 6)
        type = RenameBlockGenerator
        input = del
        old_block = '1 2 3 4 5 6 7 8 9 10 11 12 13'
        new_block = 'graphite compact wall_e wall_a wall_c ctrl_rod top_refl bottom_refl radial_refl insulation vessel gap wall_hx'
    []
    [rename_heatpipe]                                       # Rename blocks to clear(er) names (see block key, line 6)
        type = RenameBlockGenerator
        input = rename_blocks
        old_block = '20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48
                     50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78
                     80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108'
        new_block = 'vap1 vap2 vap3 vap4 vap5 vap6 vap7 vap8 vap9 vap10 vap11 vap12 vap13 vap14 vap15 vap16 vap17 vap18 vap19 vap20
                     vap21 vap22 vap23 vap24 vap25 vap26 vap27 vap28 vap29
                     wick1 wick2 wick3 wick4 wick5 wick6 wick7 wick8 wick9 wick10 wick11 wick12 wick13 wick14 wick15 wick16 wick17
                     wick18 wick19 wick20 wick21 wick22 wick23 wick24 wick25 wick26 wick27 wick28 wick29
                     liq1 liq2 liq3 liq4 liq5 liq6 liq7 liq8 liq9 liq10 liq11 liq12 liq13 liq14 liq15 liq16 liq17 liq18 liq19 liq20
                     liq21 liq22 liq23 liq24 liq25 liq26 liq27 liq28 liq29'
    []
    [rename_top_bottom_bounds]                              # Rename bottom and top surfaces
        type = RenameBoundaryGenerator
        input = rename_heatpipe
        old_boundary = '10002 10003'
        new_boundary = 'bottom top'
    []
    [fuel_sideset]                                          # Surface on outside of fuel compacts
        type = SideSetsBetweenSubdomainsGenerator
        input = rename_top_bottom_bounds
        primary_block = 'compact'
        paired_block = 'graphite'
        new_boundary = 'fuel_mod_interface'
        replace = true
    []
    [wall_hx_sideset]                                       # Surface on outside of heat exchanger wall outside of the heatpipe
        type = SideSetsAroundSubdomainGenerator
        input = fuel_sideset
        block = 'wall_hx'
        include_only_external_sides = true
        replace = true
        new_boundary = 'heat_exchanger'
    []
    [evaporator_sideset_1]                                  # Surface on heatpipe evaporator section
        type = SideSetsBetweenSubdomainsGenerator
        input = wall_hx_sideset
        primary_block = 'wall_e'
        paired_block = 'wick1'
        new_boundary = 'wall_wick_evap_1'
        replace = true
    []
    [adiabatic_sideset_1]                                   # Surface on heatpipe adiabatic section
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_1'
        primary_block = 'wall_a'
        paired_block = 'liq1'
        new_boundary = 'wall_liq_adiab_1'
        replace = true
    []
    [condenser_sideset_1]                                   # Surface on heatpipe condenser section
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_1'
        primary_block = 'wall_c'
        paired_block = 'liq1'
        new_boundary = 'wall_liq_cond_1'
        replace = true
    []
    [evaporator_sideset_2]                                  # Repeat for all 29 heatpipes
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_1'
        primary_block = 'wall_e'
        paired_block = 'wick2'
        new_boundary = 'wall_wick_evap_2'
        replace = true
    []
    [adiabatic_sideset_2]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_2'
        primary_block = 'wall_a'
        paired_block = 'liq2'
        new_boundary = 'wall_liq_adiab_2'
        replace = true
    []
    [condenser_sideset_2]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_2'
        primary_block = 'wall_c'
        paired_block = 'liq2'
        new_boundary = 'wall_liq_cond_2'
        replace = true
    []
    [evaporator_sideset_3]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_2'
        primary_block = 'wall_e'
        paired_block = 'wick3'
        new_boundary = 'wall_wick_evap_3'
        replace = true
    []
    [adiabatic_sideset_3]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_3'
        primary_block = 'wall_a'
        paired_block = 'liq3'
        new_boundary = 'wall_liq_adiab_3'
        replace = true
    []
    [condenser_sideset_3]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_3'
        primary_block = 'wall_c'
        paired_block = 'liq3'
        new_boundary = 'wall_liq_cond_3'
        replace = true
    []
    [evaporator_sideset_4]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_3'
        primary_block = 'wall_e'
        paired_block = 'wick4'
        new_boundary = 'wall_wick_evap_4'
        replace = true
    []
    [adiabatic_sideset_4]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_4'
        primary_block = 'wall_a'
        paired_block = 'liq4'
        new_boundary = 'wall_liq_adiab_4'
        replace = true
    []
    [condenser_sideset_4]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_4'
        primary_block = 'wall_c'
        paired_block = 'liq4'
        new_boundary = 'wall_liq_cond_4'
        replace = true
    []
    [evaporator_sideset_5]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_4'
        primary_block = 'wall_e'
        paired_block = 'wick5'
        new_boundary = 'wall_wick_evap_5'
        replace = true
    []
    [adiabatic_sideset_5]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_5'
        primary_block = 'wall_a'
        paired_block = 'liq5'
        new_boundary = 'wall_liq_adiab_5'
        replace = true
    []
    [condenser_sideset_5]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_5'
        primary_block = 'wall_c'
        paired_block = 'liq5'
        new_boundary = 'wall_liq_cond_5'
        replace = true
    []
    [evaporator_sideset_6]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_5'
        primary_block = 'wall_e'
        paired_block = 'wick6'
        new_boundary = 'wall_wick_evap_6'
        replace = true
    []
    [adiabatic_sideset_6]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_6'
        primary_block = 'wall_a'
        paired_block = 'liq6'
        new_boundary = 'wall_liq_adiab_6'
        replace = true
    []
    [condenser_sideset_6]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_6'
        primary_block = 'wall_c'
        paired_block = 'liq6'
        new_boundary = 'wall_liq_cond_6'
        replace = true
    []
    [evaporator_sideset_7]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_6'
        primary_block = 'wall_e'
        paired_block = 'wick7'
        new_boundary = 'wall_wick_evap_7'
        replace = true
    []
    [adiabatic_sideset_7]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_7'
        primary_block = 'wall_a'
        paired_block = 'liq7'
        new_boundary = 'wall_liq_adiab_7'
        replace = true
    []
    [condenser_sideset_7]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_7'
        primary_block = 'wall_c'
        paired_block = 'liq7'
        new_boundary = 'wall_liq_cond_7'
        replace = true
    []
    [evaporator_sideset_8]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_7'
        primary_block = 'wall_e'
        paired_block = 'wick8'
        new_boundary = 'wall_wick_evap_8'
        replace = true
    []
    [adiabatic_sideset_8]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_8'
        primary_block = 'wall_a'
        paired_block = 'liq8'
        new_boundary = 'wall_liq_adiab_8'
        replace = true
    []
    [condenser_sideset_8]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_8'
        primary_block = 'wall_c'
        paired_block = 'liq8'
        new_boundary = 'wall_liq_cond_8'
        replace = true
    []
    [evaporator_sideset_9]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_8'
        primary_block = 'wall_e'
        paired_block = 'wick9'
        new_boundary = 'wall_wick_evap_9'
        replace = true
    []
    [adiabatic_sideset_9]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_9'
        primary_block = 'wall_a'
        paired_block = 'liq9'
        new_boundary = 'wall_liq_adiab_9'
        replace = true
    []
    [condenser_sideset_9]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_9'
        primary_block = 'wall_c'
        paired_block = 'liq9'
        new_boundary = 'wall_liq_cond_9'
        replace = true
    []
    [evaporator_sideset_10]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_9'
        primary_block = 'wall_e'
        paired_block = 'wick10'
        new_boundary = 'wall_wick_evap_10'
        replace = true
    []
    [adiabatic_sideset_10]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_10'
        primary_block = 'wall_a'
        paired_block = 'liq10'
        new_boundary = 'wall_liq_adiab_10'
        replace = true
    []
    [condenser_sideset_10]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_10'
        primary_block = 'wall_c'
        paired_block = 'liq10'
        new_boundary = 'wall_liq_cond_10'
        replace = true
    []
    [evaporator_sideset_11]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_10'
        primary_block = 'wall_e'
        paired_block = 'wick11'
        new_boundary = 'wall_wick_evap_11'
        replace = true
    []
    [adiabatic_sideset_11]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_11'
        primary_block = 'wall_a'
        paired_block = 'liq11'
        new_boundary = 'wall_liq_adiab_11'
        replace = true
    []
    [condenser_sideset_11]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_11'
        primary_block = 'wall_c'
        paired_block = 'liq11'
        new_boundary = 'wall_liq_cond_11'
        replace = true
    []
    [evaporator_sideset_12]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_11'
        primary_block = 'wall_e'
        paired_block = 'wick12'
        new_boundary = 'wall_wick_evap_12'
        replace = true
    []
    [adiabatic_sideset_12]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_12'
        primary_block = 'wall_a'
        paired_block = 'liq12'
        new_boundary = 'wall_liq_adiab_12'
        replace = true
    []
    [condenser_sideset_12]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_12'
        primary_block = 'wall_c'
        paired_block = 'liq12'
        new_boundary = 'wall_liq_cond_12'
        replace = true
    []
    [evaporator_sideset_13]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_12'
        primary_block = 'wall_e'
        paired_block = 'wick13'
        new_boundary = 'wall_wick_evap_13'
        replace = true
    []
    [adiabatic_sideset_13]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_13'
        primary_block = 'wall_a'
        paired_block = 'liq13'
        new_boundary = 'wall_liq_adiab_13'
        replace = true
    []
    [condenser_sideset_13]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_13'
        primary_block = 'wall_c'
        paired_block = 'liq13'
        new_boundary = 'wall_liq_cond_13'
        replace = true
    []
    [evaporator_sideset_14]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_13'
        primary_block = 'wall_e'
        paired_block = 'wick14'
        new_boundary = 'wall_wick_evap_14'
        replace = true
    []
    [adiabatic_sideset_14]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_14'
        primary_block = 'wall_a'
        paired_block = 'liq14'
        new_boundary = 'wall_liq_adiab_14'
        replace = true
    []
    [condenser_sideset_14]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_14'
        primary_block = 'wall_c'
        paired_block = 'liq14'
        new_boundary = 'wall_liq_cond_14'
        replace = true
    []
    [evaporator_sideset_15]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_14'
        primary_block = 'wall_e'
        paired_block = 'wick15'
        new_boundary = 'wall_wick_evap_15'
        replace = true
    []
    [adiabatic_sideset_15]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_15'
        primary_block = 'wall_a'
        paired_block = 'liq15'
        new_boundary = 'wall_liq_adiab_15'
        replace = true
    []
    [condenser_sideset_15]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_15'
        primary_block = 'wall_c'
        paired_block = 'liq15'
        new_boundary = 'wall_liq_cond_15'
        replace = true
    []
    [evaporator_sideset_16]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_15'
        primary_block = 'wall_e'
        paired_block = 'wick16'
        new_boundary = 'wall_wick_evap_16'
        replace = true
    []
    [adiabatic_sideset_16]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_16'
        primary_block = 'wall_a'
        paired_block = 'liq16'
        new_boundary = 'wall_liq_adiab_16'
        replace = true
    []
    [condenser_sideset_16]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_16'
        primary_block = 'wall_c'
        paired_block = 'liq16'
        new_boundary = 'wall_liq_cond_16'
        replace = true
    []
    [evaporator_sideset_17]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_16'
        primary_block = 'wall_e'
        paired_block = 'wick17'
        new_boundary = 'wall_wick_evap_17'
        replace = true
    []
    [adiabatic_sideset_17]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_17'
        primary_block = 'wall_a'
        paired_block = 'liq17'
        new_boundary = 'wall_liq_adiab_17'
        replace = true
    []
    [condenser_sideset_17]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_17'
        primary_block = 'wall_c'
        paired_block = 'liq17'
        new_boundary = 'wall_liq_cond_17'
        replace = true
    []
    [evaporator_sideset_18]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_17'
        primary_block = 'wall_e'
        paired_block = 'wick18'
        new_boundary = 'wall_wick_evap_18'
        replace = true
    []
    [adiabatic_sideset_18]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_18'
        primary_block = 'wall_a'
        paired_block = 'liq18'
        new_boundary = 'wall_liq_adiab_18'
        replace = true
    []
    [condenser_sideset_18]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_18'
        primary_block = 'wall_c'
        paired_block = 'liq18'
        new_boundary = 'wall_liq_cond_18'
        replace = true
    []
    [evaporator_sideset_19]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_18'
        primary_block = 'wall_e'
        paired_block = 'wick19'
        new_boundary = 'wall_wick_evap_19'
        replace = true
    []
    [adiabatic_sideset_19]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_19'
        primary_block = 'wall_a'
        paired_block = 'liq19'
        new_boundary = 'wall_liq_adiab_19'
        replace = true
    []
    [condenser_sideset_19]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_19'
        primary_block = 'wall_c'
        paired_block = 'liq19'
        new_boundary = 'wall_liq_cond_19'
        replace = true
    []
    [evaporator_sideset_20]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_19'
        primary_block = 'wall_e'
        paired_block = 'wick20'
        new_boundary = 'wall_wick_evap_20'
        replace = true
    []
    [adiabatic_sideset_20]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_20'
        primary_block = 'wall_a'
        paired_block = 'liq20'
        new_boundary = 'wall_liq_adiab_20'
        replace = true
    []
    [condenser_sideset_20]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_20'
        primary_block = 'wall_c'
        paired_block = 'liq20'
        new_boundary = 'wall_liq_cond_20'
        replace = true
    []
    [evaporator_sideset_21]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_20'
        primary_block = 'wall_e'
        paired_block = 'wick21'
        new_boundary = 'wall_wick_evap_21'
        replace = true
    []
    [adiabatic_sideset_21]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_21'
        primary_block = 'wall_a'
        paired_block = 'liq21'
        new_boundary = 'wall_liq_adiab_21'
        replace = true
    []
    [condenser_sideset_21]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_21'
        primary_block = 'wall_c'
        paired_block = 'liq21'
        new_boundary = 'wall_liq_cond_21'
        replace = true
    []
    [evaporator_sideset_22]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_21'
        primary_block = 'wall_e'
        paired_block = 'wick22'
        new_boundary = 'wall_wick_evap_22'
        replace = true
    []
    [adiabatic_sideset_22]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_22'
        primary_block = 'wall_a'
        paired_block = 'liq22'
        new_boundary = 'wall_liq_adiab_22'
        replace = true
    []
    [condenser_sideset_22]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_22'
        primary_block = 'wall_c'
        paired_block = 'liq22'
        new_boundary = 'wall_liq_cond_22'
        replace = true
    []
    [evaporator_sideset_23]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_22'
        primary_block = 'wall_e'
        paired_block = 'wick23'
        new_boundary = 'wall_wick_evap_23'
        replace = true
    []
    [adiabatic_sideset_23]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_23'
        primary_block = 'wall_a'
        paired_block = 'liq23'
        new_boundary = 'wall_liq_adiab_23'
        replace = true
    []
    [condenser_sideset_23]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_23'
        primary_block = 'wall_c'
        paired_block = 'liq23'
        new_boundary = 'wall_liq_cond_23'
        replace = true
    []
    [evaporator_sideset_24]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_23'
        primary_block = 'wall_e'
        paired_block = 'wick24'
        new_boundary = 'wall_wick_evap_24'
        replace = true
    []
    [adiabatic_sideset_24]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_24'
        primary_block = 'wall_a'
        paired_block = 'liq24'
        new_boundary = 'wall_liq_adiab_24'
        replace = true
    []
    [condenser_sideset_24]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_24'
        primary_block = 'wall_c'
        paired_block = 'liq24'
        new_boundary = 'wall_liq_cond_24'
        replace = true
    []
    [evaporator_sideset_25]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_24'
        primary_block = 'wall_e'
        paired_block = 'wick25'
        new_boundary = 'wall_wick_evap_25'
        replace = true
    []
    [adiabatic_sideset_25]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_25'
        primary_block = 'wall_a'
        paired_block = 'liq25'
        new_boundary = 'wall_liq_adiab_25'
        replace = true
    []
    [condenser_sideset_25]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_25'
        primary_block = 'wall_c'
        paired_block = 'liq25'
        new_boundary = 'wall_liq_cond_25'
        replace = true
    []
    [evaporator_sideset_26]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_25'
        primary_block = 'wall_e'
        paired_block = 'wick26'
        new_boundary = 'wall_wick_evap_26'
        replace = true
    []
    [adiabatic_sideset_26]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_26'
        primary_block = 'wall_a'
        paired_block = 'liq26'
        new_boundary = 'wall_liq_adiab_26'
        replace = true
    []
    [condenser_sideset_26]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_26'
        primary_block = 'wall_c'
        paired_block = 'liq26'
        new_boundary = 'wall_liq_cond_26'
        replace = true
    []
    [evaporator_sideset_27]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_26'
        primary_block = 'wall_e'
        paired_block = 'wick27'
        new_boundary = 'wall_wick_evap_27'
        replace = true
    []
    [adiabatic_sideset_27]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_27'
        primary_block = 'wall_a'
        paired_block = 'liq27'
        new_boundary = 'wall_liq_adiab_27'
        replace = true
    []
    [condenser_sideset_27]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_27'
        primary_block = 'wall_c'
        paired_block = 'liq27'
        new_boundary = 'wall_liq_cond_27'
        replace = true
    []
    [evaporator_sideset_28]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_27'
        primary_block = 'wall_e'
        paired_block = 'wick28'
        new_boundary = 'wall_wick_evap_28'
        replace = true
    []
    [adiabatic_sideset_28]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_28'
        primary_block = 'wall_a'
        paired_block = 'liq28'
        new_boundary = 'wall_liq_adiab_28'
        replace = true
    []
    [condenser_sideset_28]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_28'
        primary_block = 'wall_c'
        paired_block = 'liq28'
        new_boundary = 'wall_liq_cond_28'
        replace = true
    []
    [evaporator_sideset_29]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_28'
        primary_block = 'wall_e'
        paired_block = 'wick29'
        new_boundary = 'wall_wick_evap_29'
        replace = true
    []
    [adiabatic_sideset_29]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_sideset_29'
        primary_block = 'wall_a'
        paired_block = 'liq29'
        new_boundary = 'wall_liq_adiab_29'
        replace = true
    []
    [condenser_sideset_29]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'adiabatic_sideset_29'
        primary_block = 'wall_c'
        paired_block = 'liq29'
        new_boundary = 'wall_liq_cond_29'
        replace = true
    []
    [evaporator_vapor_bottom_1]                             # Surface on bottom of heatpipe
        type = SideSetsBetweenSubdomainsGenerator
        input = 'condenser_sideset_29'
        primary_block = 'wall_e'
        paired_block = 'vap1'
        new_boundary = 'wall_vap_bot_1'
        replace = true
    []
    [evaporator_vapor_bottom_2]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_1'
        primary_block = 'wall_e'
        paired_block = 'vap2'
        new_boundary = 'wall_vap_bot_2'
        replace = true
    []
    [evaporator_vapor_bottom_3]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_2'
        primary_block = 'wall_e'
        paired_block = 'vap3'
        new_boundary = 'wall_vap_bot_3'
        replace = true
    []
    [evaporator_vapor_bottom_4]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_3'
        primary_block = 'wall_e'
        paired_block = 'vap4'
        new_boundary = 'wall_vap_bot_4'
        replace = true
    []
    [evaporator_vapor_bottom_5]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_4'
        primary_block = 'wall_e'
        paired_block = 'vap5'
        new_boundary = 'wall_vap_bot_5'
        replace = true
    []
    [evaporator_vapor_bottom_6]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_5'
        primary_block = 'wall_e'
        paired_block = 'vap6'
        new_boundary = 'wall_vap_bot_6'
        replace = true
    []
    [evaporator_vapor_bottom_7]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_6'
        primary_block = 'wall_e'
        paired_block = 'vap7'
        new_boundary = 'wall_vap_bot_7'
        replace = true
    []
    [evaporator_vapor_bottom_8]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_7'
        primary_block = 'wall_e'
        paired_block = 'vap8'
        new_boundary = 'wall_vap_bot_8'
        replace = true
    []
    [evaporator_vapor_bottom_9]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_8'
        primary_block = 'wall_e'
        paired_block = 'vap9'
        new_boundary = 'wall_vap_bot_9'
        replace = true
    []
    [evaporator_vapor_bottom_10]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_9'
        primary_block = 'wall_e'
        paired_block = 'vap10'
        new_boundary = 'wall_vap_bot_10'
        replace = true
    []
    [evaporator_vapor_bottom_11]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_10'
        primary_block = 'wall_e'
        paired_block = 'vap11'
        new_boundary = 'wall_vap_bot_11'
        replace = true
    []
    [evaporator_vapor_bottom_12]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_11'
        primary_block = 'wall_e'
        paired_block = 'vap12'
        new_boundary = 'wall_vap_bot_12'
        replace = true
    []
    [evaporator_vapor_bottom_13]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_12'
        primary_block = 'wall_e'
        paired_block = 'vap13'
        new_boundary = 'wall_vap_bot_13'
        replace = true
    []
    [evaporator_vapor_bottom_14]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_13'
        primary_block = 'wall_e'
        paired_block = 'vap14'
        new_boundary = 'wall_vap_bot_14'
        replace = true
    []
    [evaporator_vapor_bottom_15]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_14'
        primary_block = 'wall_e'
        paired_block = 'vap15'
        new_boundary = 'wall_vap_bot_15'
        replace = true
    []
    [evaporator_vapor_bottom_16]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_15'
        primary_block = 'wall_e'
        paired_block = 'vap16'
        new_boundary = 'wall_vap_bot_16'
        replace = true
    []
    [evaporator_vapor_bottom_17]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_16'
        primary_block = 'wall_e'
        paired_block = 'vap17'
        new_boundary = 'wall_vap_bot_17'
        replace = true
    []
    [evaporator_vapor_bottom_18]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_17'
        primary_block = 'wall_e'
        paired_block = 'vap18'
        new_boundary = 'wall_vap_bot_18'
        replace = true
    []
    [evaporator_vapor_bottom_19]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_18'
        primary_block = 'wall_e'
        paired_block = 'vap19'
        new_boundary = 'wall_vap_bot_19'
        replace = true
    []
    [evaporator_vapor_bottom_20]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_19'
        primary_block = 'wall_e'
        paired_block = 'vap20'
        new_boundary = 'wall_vap_bot_20'
        replace = true
    []
    [evaporator_vapor_bottom_21]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_20'
        primary_block = 'wall_e'
        paired_block = 'vap21'
        new_boundary = 'wall_vap_bot_21'
        replace = true
    []
    [evaporator_vapor_bottom_22]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_21'
        primary_block = 'wall_e'
        paired_block = 'vap22'
        new_boundary = 'wall_vap_bot_22'
        replace = true
    []
    [evaporator_vapor_bottom_23]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_22'
        primary_block = 'wall_e'
        paired_block = 'vap23'
        new_boundary = 'wall_vap_bot_23'
        replace = true
    []
    [evaporator_vapor_bottom_24]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_23'
        primary_block = 'wall_e'
        paired_block = 'vap24'
        new_boundary = 'wall_vap_bot_24'
        replace = true
    []
    [evaporator_vapor_bottom_25]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_24'
        primary_block = 'wall_e'
        paired_block = 'vap25'
        new_boundary = 'wall_vap_bot_25'
        replace = true
    []
    [evaporator_vapor_bottom_26]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_25'
        primary_block = 'wall_e'
        paired_block = 'vap26'
        new_boundary = 'wall_vap_bot_26'
        replace = true
    []
    [evaporator_vapor_bottom_27]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_26'
        primary_block = 'wall_e'
        paired_block = 'vap27'
        new_boundary = 'wall_vap_bot_27'
        replace = true
    []
    [evaporator_vapor_bottom_28]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_27'
        primary_block = 'wall_e'
        paired_block = 'vap28'
        new_boundary = 'wall_vap_bot_28'
        replace = true
    []
    [evaporator_vapor_bottom_29]
        type = SideSetsBetweenSubdomainsGenerator
        input = 'evaporator_vapor_bottom_28'
        primary_block = 'wall_e'
        paired_block = 'vap29'
        new_boundary = 'wall_vap_bot_29'
        replace = true
    []
[]