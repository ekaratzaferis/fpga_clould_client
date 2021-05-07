call rem_files.bat

::Following coregen commands to be uncommented  when the parameter DEBUG_EN is changed from 0 to 1 in MIG.v/.vhd file.
::coregen -b makeproj.bat
::coregen -p . -b icon4_cg.xco
::coregen -p . -b vio_async_in96_cg.xco
::coregen -p . -b vio_async_in192_cg.xco
::coregen -p . -b vio_sync_out32_cg.xco
::coregen -p . -b vio_async_in100_cg.xco

::del *.ncf
echo Synthesis Tool: XST

mkdir "../synth/__projnav" > ise_flow_results.txt
mkdir "../synth/xst" >> ise_flow_results.txt
mkdir "../synth/xst/work" >> ise_flow_results.txt

xst -ifn xst_run.txt -ofn mem_interface_top.syr -intstyle ise >> ise_flow_results.txt
ngdbuild -intstyle ise -dd ../synth/_ngo -nt timestamp -uc MIG.ucf -p xc5vlx110tff1136-1 MIG.ngc MIG.ngd >> ise_flow_results.txt

map -intstyle ise -detail -w -logic_opt off -ol high -xe n -t 1 -cm area -o MIG_map.ncd MIG.ngd MIG.pcf >> ise_flow_results.txt
par -w -intstyle ise -ol high -xe n MIG_map.ncd MIG.ncd MIG.pcf >> ise_flow_results.txt
trce -e 3 -xml MIG MIG.ncd -o MIG.twr MIG.pcf >> ise_flow_results.txt
bitgen -intstyle ise -f mem_interface_top.ut MIG.ncd >> ise_flow_results.txt

echo done!
