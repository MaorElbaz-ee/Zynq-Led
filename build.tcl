# step 1 : creating project
create_project Zynq_Led ./Zynq_Led -part xc7z020clg400-1
# step 2 : choosing the board
set_property board_part digilentinc.com:arty-z7-20:part0:1.1 [current_project]
# step 3 : building the block design
source ./system_bd.tcl
# step 4 : creating wrapper and adding to the project
add_files -norecurse [make_wrapper -files [get_files system.bd] -top]
# step 5 : setting wrapper as top
set_property top system_wrapper [current_fileset]
# step 6 : synthesys implemenation and bitstream
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1