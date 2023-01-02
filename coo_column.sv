`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2022 20:04:58
// Design Name: 
// Module Name: coo_column
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module coo_column(gen1,gen3,result);
parameter N=7;
parameter M=9;
parameter L=4;
parameter K=4;

input integer gen1[0:N-1][0:2];
input integer gen3[0:M-1][0:2];
integer gen2[0:M-1][0:2];//='{'{4,4,8},'{0,0,2},'{0,2,8},'{0,3,2},'{1,2,1},'{2,0,3},'{2,2,4},'{3,1,1},'{3,2,2}};
//integer gen4[0:N-1][0:2];//='{'{4,4,6},'{0,0,4},'{0,3,2},'{1,2,1},'{2,1,2},'{3,0,9},'{3,2,2}};

output int result[0:L-1][0:K-1];
//int result1[0:3][0:3];

static integer min_idx;
static integer temp=0;
typedef integer array[0:M-2];

integer c[0:M-2];
integer a;
integer d[0:M-1][0:2];


always_comb
begin
begin
gen2=gen3;
//gen4=gen1;
end



begin
for(int i=1;i<M;i++)
begin
 c[i-1]=gen2[i][1];
end


c=selsort(c,8);


d[0][0:2]=(gen2[0][0:2]);
for(int i=1;i<M;i++)
begin
d[i][1]=c[i-1];
end
end

for(int p=1;p<M;p++)
begin
for(int q=1;q<M;q++)
begin
if (d[p][1]==gen2[q][1])
begin
        d[p][0:2]=gen2[q][0:2];
		gen2[q][0:2]='{a,a,a};
		break;
		end
end
end

//multiplication

for(integer j=1;j<M;j++)
begin
	for(integer i=1;i<N;i++)
	begin
		if(gen1[i][1] == d[j][0])
		  
		  result[gen1[i][0]][d[j][1]] = (result[gen1[i][0]][d[j][1]])+(gen1[i][2] * d[j][2]);
	end

end
end
//assign result=result1;

function array selsort(integer arr[0:M-2],integer n);
for(integer step=0;step<(n-1);step++)
begin
	min_idx = step;
	for(integer i=(step+1);i<n;i++)
	begin
		if(arr[i] < arr[min_idx])
		begin
			min_idx = i;
		end
	end
	temp = arr[min_idx];
	arr[min_idx] = arr[step];
	arr[step] = temp;
end
return arr;
endfunction
endmodule
