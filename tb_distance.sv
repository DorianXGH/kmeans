module tb_distance();
    logic [31:0] dists [2**8-1:0];
    logic [31:0] centroids [2**8-1:0][1:0];
    logic [31:0] data [1:0];
    distance d_block (.dists(dists),.centroids(centroids),.point(data));
    initial // initial block executes only once
        begin
            for (int i = 0; i<2**8; i++) begin
                centroids[i][0] = (3*i**3)%(5*23*3*2);
                centroids[i][1] = (7*i**4)%(11*23*3);
            end
            data[0] = 51;
            data[1] = 68;
            #30ns; // wait for period 

            data[0] = 150;
            data[1] = 2;
            #30ns;

            data[0] = 90;
            data[1] = 200;
            #30ns;

            data[0] = 250;
            data[1] = 340;
            #30ns;

            data[0] = 321;
            data[1] = 200;
            #30ns;

            data[0] = 803;
            data[1] = 980;
            #30ns;

            data[0] = 1520;
            data[1] = 705;
            #30ns;

            data[0] = 1204;
            data[1] = 2012;
            #30ns;
        end

endmodule