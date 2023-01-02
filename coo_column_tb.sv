`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2022 20:41:47
// Design Name: 
// Module Name: coo_column_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module coo_column_tb();
reg [31:0] gen3[0:8][0:2];
reg [31:0] gen1[0:6][0:2];
//integer gen2[0:M-1][0:2]=gen3;
wire [31:0] result[0:3][0:3];

coo_column DUT (gen1,gen3,result);
initial
begin
gen3 = '{'{4,4,8},'{0,0,2},'{0,2,8},'{0,3,2},'{1,2,1},'{2,0,3},'{2,2,4},'{3,1,1},'{3,2,2}};
gen1='{'{4,4,6},'{0,0,4},'{0,3,2},'{1,2,1},'{2,1,2},'{3,0,9},'{3,2,2}};
#1000 $finish;
end
endmodule
