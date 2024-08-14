
// Interface structures for registerbank symbol access


//`ifndef _Minivan_
//  `define _Minivan_

package Minivan_pkg;// Wire interface for sys_cfg
typedef struct packed {
  logic       enable_stuf;                     // Enable stuf
  logic       enable_other;                    // Enable other stuf
  logic [4:0] monitor_flag;                    // 
  logic [7:0] nytreg;                          // 
  logic [7:0] nytreg;                          // 
  logic [7:0] debug;                           // 
  logic [7:0] pwm_duty_red;                    // 
  logic [7:0] pwm_duty_green;                  // 
  logic [7:0] pwm_duty_blue;                   // 
} rb_sys_cfg_wire_t;

// Wire interface for debug
typedef struct packed {
} rb_debug_wire_t;


endpackage

//`endif
