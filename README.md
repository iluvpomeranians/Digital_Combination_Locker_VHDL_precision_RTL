# Digital_Combination_Locker_VHDL_precision_RTL
****

Final project for COEN313 to design, test and sythesize a 3-digit Digital Combination locker. Each VHDL code segment was be examined to
sufficiently provide a clear explanation for all signals, arrays, states and sensitivity lists. Then,
we provide two conceptual diagrams of our entire design in the form of a FSM diagram & an
ASM diagram. Lastly, we will inspect the judicious choices we made to design our DO-file test
vector and analyze our command-line Modelsim simulation results.

# Goal:
----
We were to design a finite state machine 3-digit combination locker that implemented
synchronous design methodology to satisfy the diagram & text specifications given. The
standard formatted structure of a FSM was followed to organize our code by having a state
register, a next state logic block and an output logic block. Next, by encapsulating with the use
of 4 separate processes, we modularized the functionality for each of the following components:
A) Controller, B) Load inputs, C)Multiplexer and D) Comparator.


