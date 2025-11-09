## Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Reset button
set_property PACKAGE_PIN U18 [get_ports rst]

## Direction buttons
set_property PACKAGE_PIN M18 [get_ports up]
set_property PACKAGE_PIN M19 [get_ports down]
set_property PACKAGE_PIN L17 [get_ports left]
set_property PACKAGE_PIN L18 [get_ports right]

## Shape switches
set_property PACKAGE_PIN V17 [get_ports {shape[0]}]
set_property PACKAGE_PIN V16 [get_ports {shape[1]}]

## Color switches
set_property PACKAGE_PIN W16 [get_ports {color[0]}]
set_property PACKAGE_PIN W17 [get_ports {color[1]}]

## VGA outputs
set_property PACKAGE_PIN G15 [get_ports r]
set_property PACKAGE_PIN F15 [get_ports g]
set_property PACKAGE_PIN D16 [get_ports b]
set_property PACKAGE_PIN H17 [get_ports hsync]
set_property PACKAGE_PIN J15 [get_ports vsync]
