// This file is part of K-means module
// Copyright (C) 2022  Dorian Bourgeoisat
// SPDX-License-Identifier: GPL-3.0-or-later

module large_min #(
    parameter int n = 8
)
(
    input logic [31:0] dists [2**n-1:0],
    output logic [31:0] id_class
);
    logic [31:0] idx [n-1:0][2**n-1:0];
    always_comb begin
        for (int i = 0; i<n; i++) begin
            if (i==0) begin
                for(int j = 0; j<2**n; j++) begin
                    idx[i][j] = j;
                end
            end
            else begin
                for(int j = 0; j<2**(n-i); j++) begin
                    idx[i][(2**i)*j] = (dists[idx[i-1][(2**i)*j]] < dists[idx[i-1][(2**i)*j+(2**(i-1))]]) ? idx[i-1][(2**i)*j] : idx[i-1][(2**i)*j+(2**(i-1))];
                end
            end
        end
        id_class = idx[n-1][0];
    end
/* k classes, each has a distance to the point, we begin with an identity index, then we compare 2 by 2 to find the index with the minimum distance
we iterate with the results to have a comparison tree */

endmodule
