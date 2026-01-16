module Interrupt_Ack_Clear #(
    parameter NUM_IRQ = 3
)(
    input  logic                     irq_valid,
    input  logic                     cpu_ack,
    input  logic [ID_WIDTH-1:0]      irq_id,
    output logic [NUM_IRQ-1:0]       irq_clear
);

    localparam ID_WIDTH = (NUM_IRQ > 1) ? $clog2(NUM_IRQ) : 1;

    always_comb begin
        irq_clear = '0;
        if (irq_valid && cpu_ack)
            irq_clear[irq_id] = 1'b1;
    end

endmodule
