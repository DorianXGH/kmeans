// This file is part of K-means module
// Copyright (C) 2022  Dorian Bourgeoisat
// SPDX-License-Identifier: GPL-3.0-or-later

module tb_large_min();
    logic [31:0] dists [2**8-1:0];
    logic [31:0] id_class;
    large_min min_block (.dists(dists),.id_class(id_class));
    initial // initial block executes only once
        begin
            for (int i = 0; i<2**8; i++) begin
                dists[i] = i;
            end
            #30ns; // wait for period 

            for (int i = 0; i<2**8; i++) begin
                dists[i] = i**2-6*i+10;
            end
            #30ns;

            for (int i = 0; i<2**8; i++) begin
                dists[i] = i**2-10*i+30;
            end
            #30ns;
        end

endmodule
