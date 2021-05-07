`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Efstathios Alexandros Karatzaferis
// E-Mail: ekaratzaferis@gmail.com
// 
// Module Name: edge_detect 
// Project Name: Thin Client For Cloud Connection
// Target Devices: Digilent Atlys Spartan 6
// Tool versions: Xilinx ISE Project Navigator
//
// Description: 
//
// Generic clock sync
// Note that this doesn't debounce pushbuttons completely as the window
// is far too small. This doesn't matter in this example because the
// main FSM has a large delay after sending a packet during which the
// switch is not read.
//////////////////////////////////////////////////////////////////////////////////
module edge_detect(
	input button,
   input clk,
	
   output reg rise,
   output reg fall
);

  reg [2:0] resync;

  always @(posedge clk)
  begin
    // detect rising and falling edges.
    rise <= resync[1] & !resync[2];
    fall <= resync[2] & !resync[1];
    // update history shifter.
    resync <= {resync[1:0], button};
  end

endmodule

