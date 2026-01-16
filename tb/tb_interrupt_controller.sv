`timescale 1ns/1ps

module tb_interrupt_controller;

    parameter NUM_IRQ = 3;
    parameter TIMER_WIDTH = 16;

    logic clk, rst;
    logic timer_enable, timer_clear;
    logic [TIMER_WIDTH-1:0] timer_compare;
    logic [NUM_IRQ-2:0] ext_irq;
    logic [NUM_IRQ-1:0] irq_enable, irq_mask;
    logic cpu_ack;
    logic irq_out;
    logic [$clog2(NUM_IRQ)-1:0] irq_id;

    Interrupt_Controller_Top #(
        .NUM_IRQ(NUM_IRQ),
        .TIMER_WIDTH(TIMER_WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .timer_enable(timer_enable),
        .timer_clear(timer_clear),
        .timer_compare(timer_compare),
        .ext_irq(ext_irq),
        .irq_enable(irq_enable),
        .irq_mask(irq_mask),
        .cpu_ack(cpu_ack),
        .irq_out(irq_out),
        .irq_id(irq_id)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        timer_enable = 0;
        timer_clear  = 0;
        timer_compare = 10;
        ext_irq = '0;
        irq_enable = '1;
        irq_mask = '0;
        cpu_ack = 0;

        #20 rst = 0;

        timer_enable = 1;
        #200;

        cpu_ack = 1;
        #10 cpu_ack = 0;

        #50;
        ext_irq[0] = 1;
        #10 ext_irq[0] = 0;

        #50;
        cpu_ack = 1;
        #10 cpu_ack = 0;

        #100 $stop;
    end

endmodule
