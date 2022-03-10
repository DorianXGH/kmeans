// This file is part of K-means module
// Copyright (C) 2022  Dorian Bourgeoisat
// SPDX-License-Identifier: GPL-3.0-or-later

module distance #(
    parameter int n = 8,
    parameter int d = 2
)
(
    input logic [31:0] centroids [2**n-1:0][d-1:0],
    input logic [31:0] point [d-1:0],
    output logic [31:0] dists [2**n-1:0]
);
    logic [31:0] relat [2**n-1:0][d];
    always_comb begin
        for(int i = 0; i<(2**n);i++) begin
            for(int j = 0; j<d;j++) begin
                relat[i][j]=centroids[i][j]-point[j];
            end
        end
        for(int i = 0; i<(2**n);i++) begin
            dists[i] = relat[i][0]**2+relat[i][1]**2;
        end
    end

endmodule
