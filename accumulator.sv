// This file is part of K-means module
// Copyright (C) 2022  Dorian Bourgeoisat
// SPDX-License-Identifier: GPL-3.0-or-later

module accumulator
#(
    parameter int n = 8,
    parameter int d = 2
)
(
    input logic [31:0] centroids [2**n-1:0][d-1:0],
    input logic [31:0] point [d-1:0],
    input logic clk,
    input logic rst,
    input logic acc,
    input logic swap,
    output logic done,
    output logic [32:0] new_centroids [2**n-1:0][d-1:0]
);
    logic [63:0] accu [2**n-1:0][d-1:0];
    logic [31:0] incr [2**n-1:0];
    logic [31:0] id_class;
    classifier #(8,2) cl(.centroids(centroids),.point(point),.id_class(id_class));
    always_ff@(posedge clk) if (rst) begin
        for(int i = 0; i < 2**n; i++) begin
            for(int j = 0; j<d; j++) begin
                accu[i][j] <= 0;
            end
            incr[i] <= 0;
        end
    end else begin
        if (acc) begin
            accu[id_class][0] <= accu[id_class][0] + point[0];
            accu[id_class][1] <= accu[id_class][1] + point[1];
            incr[id_class] <= incr[id_class] + 1;
        end
        if (swap) begin
            for(int i = 0; i < 2**n; i++) begin
                for(int j = 0; j<d; j++) begin
                    new_centroids[i][j] <= accu[i][j]/incr[i];
                end
            end
        end
    end
    
endmodule
