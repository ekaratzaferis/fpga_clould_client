
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name fpga_client_v2 -dir "C:/VHDL/fpga_client_v2/planAhead_run_5" -part xc5vlx110tff1136-1
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/VHDL/fpga_client_v2/emac_example_design.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/VHDL/fpga_client_v2} {ipcore_dir} }
add_files [list {ipcore_dir/ram_2940x16.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ram_719x16.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "top_ucf.ucf" [current_fileset -constrset]
add_files [list {top_ucf.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/VHDL/fpga_client_v2/emac_example_design.ncd"
if {[catch {read_twx -name results_1 -file "C:/VHDL/fpga_client_v2/emac_example_design.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/VHDL/fpga_client_v2/emac_example_design.twx\": $eInfo"
}
