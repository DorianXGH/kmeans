// This file is part of K-means module
// Copyright (C) 2022  Dorian Bourgeoisat
// SPDX-License-Identifier: GPL-3.0-or-later

module classifier #(
    parameter int n = 8,
    parameter int d = 2
)
(
    input logic [31:0] centroids [2**n-1:0][d-1:0],
    input logic [31:0] point [d-1:0],
    output logic [31:0] id_class
);
    logic [31:0] dists [2**n-1:0];
    distance #(8,2) d_block (.dists(dists),.centroids(centroids),.point(point));
    large_min #(8) min_block (.dists(dists),.id_class(id_class));
endmodule
