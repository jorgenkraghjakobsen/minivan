
// Interface structures for registerbank symbol access


//`ifndef _minivan_
//  `define _minivan_

package minivan_pkg;// Wire interface for sys_cfg
typedef struct packed {
  logic       enable_stuf;                     // Enable stuf
  logic       enable_other;                    // Enable other stuf
  logic [5:0] debug_out;                       // Monitor internal flag
  logic [5:0] debug_led;                       // Debug led signals
  logic [7:0] spare_0;                         // Spare_reg0
  logic [7:0] spare_1;                         // Spare_reg1
  logic [7:0] spare_2;                         // Spare_reg2
} rb_sys_cfg_wire_t;

// Wire interface for pwm_cfg
typedef struct packed {
  logic [7:0] pwm_red;                         // Counter value for pwm
  logic [7:0] pwm_green;                       // Counter value for pwm
  logic [7:0] pwm_blue;                        // Counter value for pwm
} rb_pwm_cfg_wire_t;


endpackage

//`endif
