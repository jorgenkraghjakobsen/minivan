// removed package "minivan_pkg"
// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:7:1
// removed ["import minivan_pkg::*;"]
module minivan (
	clk,
	resetb,
	ena,
	i2c_scl,
	i2c_sda,
	data_in,
	data_out,
	data_delayed_out,
	pwm_red_out,
	pwm_green_out,
	pwm_blue_out,
	debug_out,
	debug_in
);
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:12:5
	input clk;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:13:5
	input resetb;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:14:5
	input ena;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:17:5
	input i2c_scl;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:19:5
	inout i2c_sda;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:23:5
	input data_in;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:24:5
	output wire data_out;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:25:5
	output wire data_delayed_out;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:28:5
	output wire pwm_red_out;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:29:5
	output wire pwm_green_out;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:30:5
	output wire pwm_blue_out;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:33:5
	output wire [5:0] debug_out;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:34:5
	input debug_in;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:40:5
	// removed localparam type minivan_pkg_rb_sys_cfg_wire_t
	wire [37:0] sys_cfg;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:41:5
	// removed localparam type minivan_pkg_rb_pwm_cfg_wire_t
	wire [23:0] pwm_cfg;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:47:5
	assign data_out = data_in;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:50:5
	reg [15:0] data_fifo;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:52:5
	always @(posedge clk)
		// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:54:7
		if (resetb == 1'b0)
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:55:9
			data_fifo <= 16'b1010101011001100;
		else
			// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:57:9
			data_fifo <= {data_fifo[14:0], data_in};
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:61:5
	assign data_delayed_out = data_fifo[15];
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:83:5
	assign debug_out = {data_fifo[15], sys_cfg[28:24]};
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:95:1
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:96:1
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:102:1
	wire i2c_sdai;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:103:1
	wire i2c_sdao;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:104:1
	assign i2c_sdai = i2c_sda;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:105:1
	assign i2c_sda = (i2c_sdao == 1'b0 ? 1'b0 : 1'bz);
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:108:1
	wire [7:0] rb_address;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:109:1
	wire [7:0] rb_data_write_to_reg;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:110:1
	wire [7:0] rb_data_read_from_reg;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:111:1
	wire rb_reg_en;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:112:1
	wire rb_write_en;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:113:1
	wire [1:0] rb_streamSt_mon;
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:115:1
	i2c_if i2c_inst(
		.clk(clk),
		.resetb(resetb),
		.sdaIn(i2c_sdai),
		.sdaOut(i2c_sdao),
		.scl(i2c_scl),
		.address(rb_address),
		.data_write_to_reg(rb_data_write_to_reg),
		.data_read_from_reg(rb_data_read_from_reg),
		.reg_en(rb_reg_en),
		.write_en(rb_write_en),
		.streamSt_mon(rb_streamSt_mon)
	);
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:131:1
	rb_minivan rb_minivan_inst(
		.clk(clk),
		.resetb(resetb),
		.address(rb_address),
		.data_write_in(rb_data_write_to_reg),
		.data_read_out(rb_data_read_from_reg),
		.write_en(rb_write_en),
		.sys_cfg(sys_cfg),
		.pwm_cfg(pwm_cfg)
	);
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:146:1
	pwm pwm_red(
		.clock_in(clk),
		.reset(!resetb),
		.duty_cycle(pwm_cfg[23-:8]),
		.pwm_out(pwm_red_out)
	);
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:153:1
	pwm pwm_green(
		.clock_in(clk),
		.reset(!resetb),
		.duty_cycle(pwm_cfg[15-:8]),
		.pwm_out(pwm_green_out)
	);
	// Trace: /home/jakobsen/work/asic/workspace/minivan/digital/minivan/minivan.sv:160:1
	pwm pwm_blue(
		.clock_in(clk),
		.reset(!resetb),
		.duty_cycle(pwm_cfg[7-:8]),
		.pwm_out(pwm_blue_out)
	);
endmodule
