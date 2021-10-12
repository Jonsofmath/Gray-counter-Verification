`timescale 1ns/100ps

`include "gray_cond.v"
`include "contador_gray_synth.v"
`include "cmos_cells.v"
`include "probador.v"

//Test-bench.
module TestBench();

//Cables internos.
wire clk, enable, reset_L;
wire[4:0] gray_output, salida_gray;

//Instanciación del módulo conductual.
gray_cond COND
(
	/*AUTOINST*/
 // Outputs
 .gray_output				(gray_output[4:0]),
 // Inputs
 .clk					(clk),
 .enable				(enable),
 .reset_L				(reset_L));
 
//Instanciación del módulo estructural.
contador_gray_synth SYNTH
(
	/*AUTOINST*/
 // Outputs
 .salida_gray				(salida_gray[4:0]),
 // Inputs
 .clk					(clk),
 .enable				(enable),
 .reset_L				(reset_L));

//Instanciación del probador.
probador PROBADOR_
(
	/*AUTOINST*/
 // Outputs
 .clk					(clk),
 .reset_L				(reset_L),
 .enable				(enable),
 .err					(err),
 // Inputs
 .gray_output				(gray_output[4:0]),
 .salida_gray				(salida_gray[4:0]));
endmodule
