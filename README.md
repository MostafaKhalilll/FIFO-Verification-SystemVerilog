# FIFO-Verification-SystemVerilog
a simple Verification to a FIFO system module using SystemVerilog

1) Interface Creation: Develop an interface that uses a clocking block to handle the clock signal for
synchronous operations, ensuring proper sampling of input signals and driving of output signals.
2) Input Randomization: Randomize the input data for the FIFO according to the following
constraints:
a. The first 8 bits of the input data (data_in) should fall within the range [100:230].
b. The second 8 bits of the input data should fall within the range [200:255].
c. The third 8 bits of the input data should be generated with the following probabilities:
d. Range [0:100] with a probability of 30%.
e. Range [100:200] with a probability of 60%.
f. Range [200:255] with a probability of 10%.
g. The last 8 bits of the input data should fall within the range [0:50] if the first 8 bits are
greater than 150; otherwise, they should fall within the range [0:255].
h. Randomize the Read_enable and Write_enable signals with appropriate weights of your
choice.
3) Coverage Points: Implement cover points to ensure 100% coverage of the Full Flag and Empty
Flag signals.
4) Assertions1: Write an assertion to verify the following condition:
When the Write_enable signal is asserted and the FIFO is not full, the write pointer
(write_ptr) should increment.
5) Assertion 2 (Bonus):
a. Write any additional assertion that you consider important for verifying the correctness or
functionality of the FIFO design.
b. Explain the purpose and significance of this assertion.
6) Code Coverage: Perform code coverage analysis to assess the effectiveness of your testbench in
exercising the RTL code.
