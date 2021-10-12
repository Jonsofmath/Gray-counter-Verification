all: compilar
compilar:
	iverilog -o gray_cond gray_cond.v
	iverilog -o probador probador.v
	iverilog -o testBench testBench.v
	
	vvp gray_cond
	vvp probador
	vvp testBench

	emacs --batch testBench.v -f verilog-batch-auto

	gtkwave generator.vcd
