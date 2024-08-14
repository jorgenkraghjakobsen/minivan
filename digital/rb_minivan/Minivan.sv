// Register bank 
// Auto generated code from Minivan version 1 
// Written by Jørgen Kragh Jakobsen, All right reserved 
//-----------------------------------------------------------------------------
//`include "rb_Minivan_struct.svh"
import Minivan_pkg::*;

module rb_Minivan
#(parameter ADR_BITS = 8
 )
(
	input  logic				clk,
	input  logic				resetb,
	input  logic [ADR_BITS-1:0]		address,
	input  logic [7:0]			data_write_in,
	output logic [7:0] 			data_read_out,
	input  logic 				reg_en,
	input  logic 				write_en,
//---------------------------------------------
	inout rb_sys_cfg_wire_t              sys_cfg,
	inout rb_debug_wire_t                debug 
);
//------------------------------------------------Write to registers and reset-
// Create registers

    // --- Section: sys_cfg  Offset: 0x0000  Size: 16
reg        reg__sys_cfg__enable_stuf;                            //Enable stuf
reg        reg__sys_cfg__enable_other;                           //Enable other stuf
reg [4:0]  reg__sys_cfg__monitor_flag;                           //
reg [7:0]  reg__sys_cfg__pwm_duty_green;                         //
reg [7:0]  reg__sys_cfg__pwm_duty_blue;                          //
reg [7:0]  reg__sys_cfg__pwm_duty_red;                           //
reg [7:0]  reg__sys_cfg__debug;                                  //
reg [7:0]  reg__sys_cfg__nytreg;                                 //
reg [7:0]  reg__sys_cfg__nytreg;                                 //

    // --- Section: debug  Offset: 0x0020  Size: 16

always_ff @(posedge clk)
begin
  if (resetb == 0)
  begin

    // --- Section: sys_cfg  Offset: 0x0000  Size: 16
    reg__sys_cfg__enable_stuf                             <=  1'b00000000;   //Enable stuf
    reg__sys_cfg__enable_other                            <=  1'b00000001;   //Enable other stuf
    reg__sys_cfg__monitor_flag                            <=  5'b00000000;   //
    reg__sys_cfg__pwm_duty_green                          <=  8'b01000000;   //
    reg__sys_cfg__pwm_duty_blue                           <=  8'b01000000;   //
    reg__sys_cfg__pwm_duty_red                            <=  8'b01000000;   //
    reg__sys_cfg__debug                                   <=  8'b00000000;   //
    reg__sys_cfg__nytreg                                  <=  8'b00000000;   //
    reg__sys_cfg__nytreg                                  <=  8'b00000000;   //

    // --- Section: debug  Offset: 0x0020  Size: 16
  end
  else
  begin
    if (write_en)
    begin
      case (address)
        000 : begin 
              reg__sys_cfg__enable_stuf                         <=   data_write_in[0:0];  // Enable stuf
              reg__sys_cfg__enable_other                        <=   data_write_in[1:1];  // Enable other stuf
              reg__sys_cfg__monitor_flag                        <=   data_write_in[6:2];  // 
              end
        002 : reg__sys_cfg__nytreg                              <=   data_write_in[7:0];  // 
 
        003 : reg__sys_cfg__nytreg                              <=   data_write_in[7:0];  // 
 
        004 : reg__sys_cfg__debug                               <=   data_write_in[7:0];  // 
 
        005 : reg__sys_cfg__pwm_duty_red                        <=   data_write_in[7:0];  // 
 
        006 : reg__sys_cfg__pwm_duty_green                      <=   data_write_in[7:0];  // 
 
        007 : reg__sys_cfg__pwm_duty_blue                       <=   data_write_in[7:0];  // 
 
      endcase 
    end
  end
end
//---------------------------------------------
always @(posedge clk )
begin
  if (resetb == 0)
    data_read_out <= 8'b00000000;
  else
  begin
    data_read_out <= 8'b00000000;
    case (address)
        000 : begin 
              data_read_out[0:0]  <=  reg__sys_cfg__enable_stuf;                // Enable stuf
              data_read_out[1:1]  <=  reg__sys_cfg__enable_other;               // Enable other stuf
              data_read_out[6:2]  <=  reg__sys_cfg__monitor_flag;               // 
              end
        002 : data_read_out[7:0]  <=  reg__sys_cfg__nytreg;                     // 
 
        003 : data_read_out[7:0]  <=  reg__sys_cfg__nytreg;                     // 
 
        004 : data_read_out[7:0]  <=  reg__sys_cfg__debug;                      // 
 
        005 : data_read_out[7:0]  <=  reg__sys_cfg__pwm_duty_red;               // 
 
        006 : data_read_out[7:0]  <=  reg__sys_cfg__pwm_duty_green;             // 
 
        007 : data_read_out[7:0]  <=  reg__sys_cfg__pwm_duty_blue;              // 
 
      default : data_read_out <= 8'b00000000;
    endcase
  end
end
//-------------------------------------Assign symbols to structs
assign sys_cfg.enable_stuf                      = reg__sys_cfg__enable_stuf ;
assign sys_cfg.enable_other                     = reg__sys_cfg__enable_other ;
assign sys_cfg.monitor_flag                     = reg__sys_cfg__monitor_flag ;
assign sys_cfg.pwm_duty_green                   = reg__sys_cfg__pwm_duty_green ;
assign sys_cfg.pwm_duty_blue                    = reg__sys_cfg__pwm_duty_blue ;
assign sys_cfg.pwm_duty_red                     = reg__sys_cfg__pwm_duty_red ;
assign sys_cfg.debug                            = reg__sys_cfg__debug ;
assign sys_cfg.nytreg                           = reg__sys_cfg__nytreg ;
assign sys_cfg.nytreg                           = reg__sys_cfg__nytreg ;
endmodule
