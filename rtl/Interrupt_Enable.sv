module Interrupt_Enable #(
    parameter NUM_IRQ = 3
)(
    input  logic [NUM_IRQ-1:0] irq_pending,
    input  logic [NUM_IRQ-1:0] irq_enable,
    input  logic [NUM_IRQ-1:0] irq_mask,
    output logic [NUM_IRQ-1:0] irq_active
);

    assign irq_active = irq_pending & irq_enable & ~irq_mask;

endmodule
