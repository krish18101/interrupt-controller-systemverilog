module Interrupt_Pending_Logic #(
    parameter NUM_IRQ = 3
)(
    input  logic                clk,
    input  logic                rst,
    input  logic [NUM_IRQ-1:0]  irq_sources,
    input  logic [NUM_IRQ-1:0]  irq_clear,
    output logic [NUM_IRQ-1:0]  irq_pending
);

    integer i;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            irq_pending <= '0;
        end else begin
            for (i = 0; i < NUM_IRQ; i = i + 1) begin
                if (irq_clear[i])
                    irq_pending[i] <= 1'b0;
                else if (irq_sources[i])
                    irq_pending[i] <= 1'b1;
            end
        end
    end

endmodule
