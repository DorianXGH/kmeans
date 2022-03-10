module accumulator
#(
    parameter int n = 8,
    parameter int d = 2
)
(
    input logic [31:0] centroids [2**n-1:0][d-1:0],
    input logic [31:0] point [d-1:0],
    input logic clk
);
    logic [63:0] accu [2**n-1:0][d-1:0];
    logic [31:0] incr [2**n-1:0];
    logic [31:0] id_class;
    classifier cl(.centroids(centroids),.point(point),.id_class(id_class));
    always_ff@(posedge clk) begin
        accu[id_class][0] <= accu[id_class][0] + point[0];
        accu[id_class][1] <= accu[id_class][1] + point[1];
        incr[id_class] <= incr[id_class] + 1;
    end
endmodule