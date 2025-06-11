_**UART**_

Sup people...!!!
I have designed a UART design using VERILOG in which the main focus is on understanding the very basic concept of UART and FSM at its very simplest terms.

I have 3 (design sources) + 1 (testbench) in which:

**DESIGN SOURCE**

1. **uart_1**
   This design block's basic functionality are to perform things like sending 8-bit parallel data in a single clock cycle to the uart_1 module, the uart_1 will then perform its logic as written in code and
   generate a parity bit anong with sending the data + parity to the uart_2 in series using the tx_1 line.

2. **uart_2**
   This design block's basic functionality is to receive the data send from the uart_1 and check on the parity bit if there is any change in the data / corrupted data and if the parity is correct, the data
   is received from the tx_1 line else is trashed.

3. **uart_top**
   This design block's basically is used to top the 2 different design modules into a single one so that the testbench is written for the top module only which instantiate both the uart_1 and uart_2.


   **TESTBENCH**

1. **uart_tb**
   This testbench is to test the whole uart_top module.
