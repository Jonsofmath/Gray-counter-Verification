module probador
(
	//Outputs.
	output reg clk,
	output reg reset_L,
	output reg enable,
	output reg err,
	
	//Inputs.
	input[4:0] gray_output,
	input[4:0] salida_gray
);

initial
begin
	$dumpfile("generator.vcd");
	$dumpvars;
	//$display ("\tclk_4f, \tclk_32f, \tcount, \tvalid_in, \treset_L, \tdata2send, \tdata_out, \tvalid_in_e, \tdata2send_e, \tdata_out_e");
	//$monitor($time,"\t%b\t%b\t%b\t\t%b\t\t%b\t%b\t%b\t%b\t%b\t%b", clk_4f, clk_32f, count, valid_in, reset_L, data2send, data_out, valid_in_e, data2send_e, data_out_e);
	
	@(posedge clk);
	reset_L = 1'b0;
	enable = 1'b0;
	@(posedge clk);
	reset_L = 1'b0;
	enable = 1'b0;
	@(posedge clk);
	reset_L = 1'b1;
	@(posedge clk);
	enable = 1'b1;
	#1000
	enable = 1'b0;
	reset_L = 1'b0;
	$finish;
end

//Control signals.
//Clock.
initial clk <= 0;
always	#1 clk <= ~clk;

//errer.
always@(*)
begin
	if(gray_output == salida_gray)
	begin
		err = 0;
	end
	else
	begin
		err = 1;
	end	
end

endmodule