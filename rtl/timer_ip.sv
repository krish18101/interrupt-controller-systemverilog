module timer_ip #(
    parameter WIDTH = 16
)(
    input  logic             clk,
    input  logic             rst,
    input  logic             timer_enable,
    input  logic             timer_clear,
    input  logic [WIDTH-1:0] timer_compare,
    output logic [WIDTH-1:0] timer_value,
    output logic             timer_irq
);

    logic [WIDTH-1:0] counter;
    logic expired;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            counter   <= '0;
            expired   <= 1'b0;
            timer_irq <= 1'b0;
        end else if (timer_clear) begin
            counter   <= '0;
            expired   <= 1'b0;
            timer_irq <= 1'b0;
        end else if (timer_enable && !expired) begin
            counter <= counter + 1'b1;
            if (counter == timer_compare) begin
                expired   <= 1'b1;
                timer_irq <= 1'b1;
            end
        end
    end

    assign timer_value = counter;

endmodule
