module Priority_Resolver #(
    parameter NUM_IRQ = 3
)(
    input  logic [NUM_IRQ-1:0] irq_active,
    output logic               irq_valid,
    output logic [ID_WIDTH-1:0] irq_id
);

    localparam ID_WIDTH = (NUM_IRQ > 1) ? $clog2(NUM_IRQ) : 1;
    integer i;

    always_comb begin
        irq_valid = 1'b0;
        irq_id    = '0;

        for (i = 0; i < NUM_IRQ; i = i + 1) begin
            if (irq_active[i] && !irq_valid) begin
                irq_valid = 1'b1;
                irq_id    = i[ID_WIDTH-1:0];
            end
        end
    end

endmodule
