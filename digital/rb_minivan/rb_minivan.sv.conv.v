// removed package "minivan_pkg"
// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:6:1
// removed ["import minivan_pkg::*;"]
module rb_minivan (
	clk,
	resetb,
	address,
	data_write_in,
	data_read_out,
	reg_en,
	write_en,
	sys_cfg,
	pwm_cfg
);
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:9:13
	parameter ADR_BITS = 8;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:12:2
	input wire clk;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:13:2
	input wire resetb;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:14:2
	input wire [ADR_BITS - 1:0] address;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:15:2
	input wire [7:0] data_write_in;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:16:2
	output reg [7:0] data_read_out;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:17:2
	input wire reg_en;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:18:2
	input wire write_en;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:20:2
	// removed localparam type minivan_pkg_rb_sys_cfg_wire_t
	inout wire [37:0] sys_cfg;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:21:2
	// removed localparam type minivan_pkg_rb_pwm_cfg_wire_t
	inout wire [23:0] pwm_cfg;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:27:1
	reg reg__sys_cfg__enable_stuf;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:28:1
	reg reg__sys_cfg__enable_other;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:29:1
	reg [5:0] reg__sys_cfg__debug_out;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:30:1
	reg [5:0] reg__sys_cfg__debug_led;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:31:1
	reg [7:0] reg__sys_cfg__spare_0;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:32:1
	reg [7:0] reg__sys_cfg__spare_1;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:33:1
	reg [7:0] reg__sys_cfg__spare_2;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:36:1
	reg [7:0] reg__pwm_cfg__pwm_red;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:37:1
	reg [7:0] reg__pwm_cfg__pwm_green;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:38:1
	reg [7:0] reg__pwm_cfg__pwm_blue;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:40:1
	always @(posedge clk)
		// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:42:3
		if (resetb == 0) begin
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:46:5
			reg__sys_cfg__enable_stuf <= 1'b0;
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:47:5
			reg__sys_cfg__enable_other <= 1'b1;
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:48:5
			reg__sys_cfg__debug_out <= 6'b010101;
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:49:5
			reg__sys_cfg__debug_led <= 6'b010001;
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:50:5
			reg__sys_cfg__spare_0 <= 8'b00010001;
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:51:5
			reg__sys_cfg__spare_1 <= 8'b00100010;
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:52:5
			reg__sys_cfg__spare_2 <= 8'b00110011;
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:55:5
			reg__pwm_cfg__pwm_red <= 8'b10000101;
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:56:5
			reg__pwm_cfg__pwm_green <= 8'b10000101;
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:57:5
			reg__pwm_cfg__pwm_blue <= 8'b10000101;
		end
		else
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:61:5
			if (write_en)
				// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:63:7
				case (address)
					0: begin
						// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:65:15
						reg__sys_cfg__enable_stuf <= data_write_in[0:0];
						// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:66:15
						reg__sys_cfg__enable_other <= data_write_in[1:1];
					end
					1:
						// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:68:15
						reg__sys_cfg__debug_out <= data_write_in[5:0];
					2:
						// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:70:15
						reg__sys_cfg__debug_led <= data_write_in[5:0];
					3:
						// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:72:15
						reg__sys_cfg__spare_0 <= data_write_in[7:0];
					4:
						// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:74:15
						reg__sys_cfg__spare_1 <= data_write_in[7:0];
					5:
						// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:76:15
						reg__sys_cfg__spare_2 <= data_write_in[7:0];
					18:
						// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:78:15
						reg__pwm_cfg__pwm_red <= data_write_in[7:0];
					19:
						// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:80:15
						reg__pwm_cfg__pwm_green <= data_write_in[7:0];
					20:
						// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:82:15
						reg__pwm_cfg__pwm_blue <= data_write_in[7:0];
				endcase
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:89:1
	always @(posedge clk)
		// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:91:3
		if (resetb == 0)
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:92:5
			data_read_out <= 8'b00000000;
		else begin
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:95:5
			data_read_out <= 8'b00000000;
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:96:5
			case (address)
				0: begin
					// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:98:15
					data_read_out[0:0] <= reg__sys_cfg__enable_stuf;
					// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:99:15
					data_read_out[1:1] <= reg__sys_cfg__enable_other;
				end
				1:
					// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:101:15
					data_read_out[5:0] <= reg__sys_cfg__debug_out;
				2:
					// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:103:15
					data_read_out[5:0] <= reg__sys_cfg__debug_led;
				3:
					// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:105:15
					data_read_out[7:0] <= reg__sys_cfg__spare_0;
				4:
					// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:107:15
					data_read_out[7:0] <= reg__sys_cfg__spare_1;
				5:
					// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:109:15
					data_read_out[7:0] <= reg__sys_cfg__spare_2;
				18:
					// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:111:15
					data_read_out[7:0] <= reg__pwm_cfg__pwm_red;
				19:
					// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:113:15
					data_read_out[7:0] <= reg__pwm_cfg__pwm_green;
				20:
					// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:115:15
					data_read_out[7:0] <= reg__pwm_cfg__pwm_blue;
				default:
					// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:117:17
					data_read_out <= 8'b00000000;
			endcase
		end
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:122:1
	assign sys_cfg[37] = reg__sys_cfg__enable_stuf;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:123:1
	assign sys_cfg[36] = reg__sys_cfg__enable_other;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:124:1
	assign sys_cfg[35-:6] = reg__sys_cfg__debug_out;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:125:1
	assign sys_cfg[29-:6] = reg__sys_cfg__debug_led;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:126:1
	assign sys_cfg[23-:8] = reg__sys_cfg__spare_0;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:127:1
	assign sys_cfg[15-:8] = reg__sys_cfg__spare_1;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:128:1
	assign sys_cfg[7-:8] = reg__sys_cfg__spare_2;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:129:1
	assign pwm_cfg[23-:8] = reg__pwm_cfg__pwm_red;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:130:1
	assign pwm_cfg[15-:8] = reg__pwm_cfg__pwm_green;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/rb_minivan/rb_minivan.sv:131:1
	assign pwm_cfg[7-:8] = reg__pwm_cfg__pwm_blue;
endmodule
