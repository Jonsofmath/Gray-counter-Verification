module gray_cond
(
	//Inputs.
	input clk,
	input enable,
	input reset_L,
	
	//Outputs.
	output reg[4:0] gray_output
);

//Control signals.
always@(posedge clk)
begin
	if(reset_L == 0)
	begin
		#2 gray_output<='h0;
	end
end

//Count.
reg[4:0] count;

always@(posedge clk)
begin
	if(reset_L==0)
	begin
		count <= 'h0;
	end
	else
	begin
		if(enable==1)
		begin
			count <= count + 1;
		end
	end
end

//Gray coding.
always@(*)
begin	
	if(enable==1)
	begin
		gray_output = (count) ^ (count >> 1);
	end
end
endmodule