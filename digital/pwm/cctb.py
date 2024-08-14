
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from cocotb.regression import TestFactory

@cocotb.test()
async def run_test(dut):
  PERIOD = 10

  dut.clock_in = 0
  dut.reset = 0
  dut.duty_cycle = 0


  await Timer(20*PERIOD, units='ns')
  pwm_out = dut.pwm_out.value


  dut.clock_in = 0
  dut.reset = 0
  dut.duty_cycle = 0


  await Timer(20*PERIOD, units='ns')
  pwm_out = dut.pwm_out.value


# Register the test.
factory = TestFactory(run_test)
factory.generate_tests()