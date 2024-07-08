// Minivan - A small Mixedmode boilerplate 
// Written by Jørgen Kragh Jakobsen, ICWorks, June 2024

// Include register structs from the register bank generator
`define SIMPLE_DELAY

import minivan_pkg::*; 


module minivan
    ( 
    input   clk,                //! Top level clk 
    input   resetb,             //! Active low sync reset 
    input   ena,                //! Top level enable input
    
    //---I2C-----------         //! Device interface for register read/write  
    input   i2c_scl,            //! I2C clk input         
    
    input   i2c_sdai,           //! I2C data line   
    output  i2c_sdao,           //! bidirectional io handled at higher level
    
    //---Your interface here    
    input   data_in,            //! Generic input pin
    output  data_out,           //! Generic output pin
    output  data_delayed_out,   //! Delayed output pin
    
    //---PWM-----------
    output  pwm_red_out,        //! 3xPWM output for LED control
    output  pwm_green_out,      //! 
    output  pwm_blue_out,       //! 
    
    //---Debug---------
    output  [5:0] debug_out,    //! Debug out signals  
    input   debug_in            //! Single bit input   
    );

//--------------------------------------------------------------------------------------------------------
// Register bank structs  
//-------------------------------------------------------------------------------------------------------- 
    rb_sys_cfg_wire_t sys_cfg;
    rb_pwm_cfg_wire_t pwm_cfg;
    
//-------------------------------------------------------------------------------------------------------
// Debug and bespoke logic
//-------------------------------------------------------------------------------------------------------
 
    assign data_out = data_in; 

    // Delay line using registers  
    reg [15:0] data_fifo; 

    always @(posedge clk)
    begin
      if (resetb == 1'b0)
        data_fifo <= 16'b1010101011001100 ;
      else 
        data_fifo <= {data_fifo[14:0],data_in}; 
    end
    
`ifdef SIMPLE_DELAY 
    assign data_delayed_out = data_fifo[15];
`else
    wire data_delayed_tmp; 
    assign data_delayed_out = data_delayed_tmp; 
    
    case (sys_cfg.delay_sel) 
      case 4'b0000 : wire_delayed_out = data_fifo[0];
      case 4'b0001 : wire_delayed_out = data_fifo[1]; 
      case 4'b0010 : wire_delayed_out = data_fifo[2]; 
      case 4'b0011 : wire_delayed_out = data_fifo[3]; 
      case 4'b0100 : wire_delayed_out = data_fifo[4]; 
      case 4'b0101 : wire_delayed_out = data_fifo[5]; 
      case 4'b0110 : wire_delayed_out = data_fifo[6]; 
      case 4'b0111 : wire_delayed_out = data_fifo[7]; 
      default      : wire_delayed_out = data_fifo[8]; 
    endcase 
  `endif 




    // Debug logic  
    assign debug_out = { data_fifo[15], sys_cfg.debug_led[4:0]};

//--------------------------------------------------------------------------------------------------------
// Clock and reset   
//-------------------------------------------------------------------------------------------------------- 

// Direct clock input here. 
// insert PLL here when needed

//--------------------------------------------------------------------------------------------------------
// Register bank structs  
//-------------------------------------------------------------------------------------------------------- 
rb_sys_cfg_wire_t sys_cfg;
rb_pwm_cfg_wire_t pwm_cfg;

//--------------------------------------------------------------------------------------------------------
// I2C  
//-------------------------------------------------------------------------------------------------------- 
wire [7:0] rb_address;              // Default 8 bit register space 
wire [7:0] rb_data_write_to_reg;
wire [7:0] rb_data_read_from_reg;
wire rb_reg_en;    
wire rb_write_en;
wire [1:0] rb_streamSt_mon;

i2c_if i2c_inst ( 
    .clk                (clk),
    .resetb             (resetb),
    .sdaIn              (i2c_sdai),
    .sdaOut             (i2c_sdao),
    .scl                (i2c_scl),
    .address            (rb_address),
    .data_write_to_reg  (rb_data_write_to_reg), 
    .data_read_from_reg (rb_data_read_from_reg),
    .reg_en             (rb_reg_en), 
    .write_en           (rb_write_en),
    .streamSt_mon       (rb_streamSt_mon) 
    ); 
//--------------------------------------------------------------------------------------------------------
// Register bank        
//-------------------------------------------------------------------------------------------------------- 
rb_minivan rb_minivan_inst (
    .clk                (clk),
    .resetb             (resetb),
    .address            (rb_address),
    .data_write_in      (rb_data_write_to_reg), 
    .data_read_out      (rb_data_read_from_reg),
    .write_en           (rb_write_en),
    .sys_cfg            (sys_cfg),
    .pwm_cfg            (pwm_cfg)
    ); 

//-------------------------------------------------------------------------------------------------------- 
// Your block here                
//-------------------------------------------------------------------------------------------------------- 

pwm pwm_red (
    .clock_in(clk),
    .reset(!resetb),
    .duty_cycle(pwm_cfg.pwm_red),  // 0x80 -> 50% 
    .pwm_out(pwm_red_out)
); 

pwm pwm_green (
    .clock_in(clk),
    .reset(!resetb),
    .duty_cycle(sys_cfg.pwm_green),  // 0x80 -> 50% 
    .pwm_out(pwm_green_out)
); 

pwm pwm_blue ( 
    .clock_in(clk),
    .reset(!resetb),
    .duty_cycle(pwm_cfg.pwm_blue),  // 0x80 -> 50% 
    .pwm_out(pwm_blue_out)
); 

         
//-------------------------------------------------------------------------------------------------------- 
// Your block here                
//-------------------------------------------------------------------------------------------------------- 

endmodule
