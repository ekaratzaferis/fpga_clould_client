
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name fpga_client_v2 -dir "C:/VHDL/fpga_client_v2/planAhead_run_4" -part xc5vlx110tff1136-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/VHDL/fpga_client_v2/emac_example_design.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/VHDL/fpga_client_v2} {ipcore_dir} }
add_files [list {ipcore_dir/ram_2940x16.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ram_719x16.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "top_ucf.ucf" [current_fileset -constrset]
add_files [list {top_ucf.ucf}] -fileset [get_property constrset [current_run]]
link_design
