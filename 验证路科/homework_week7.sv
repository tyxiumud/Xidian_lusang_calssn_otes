class packet;
integer i=1;
integer m=2;
	function new(int val);
		i=val+1;
	endfunction
	function shift();
		i=i<<1;
	endfunction
endclass

class linkedpacket extends packet;
integer i =3;
integer k= 5;
	function(int val)
		super.new(val);
		if(val > 2)
		i = val;
	endfunction
	function shift()
	super.shift();
		i=i<<2;
	endfunction
endclass

module tb();
	initial begin
		packet p = new(3);
		linkedpacket lp = new(1);
		packet tmp;//声明一个父类句柄
		tmp = lp;//将子类对象赋值给父类句柄
	end
endmodule

//使用p可否访问到父类的i    使用 p.i 访问
//lp是否可以访问到父类的i   使用lp.super.i
//tmp是否可以访问到子类的i  不能使用tmp访问到子类的变量，tmp是一个父类的句柄，子类对象赋值给父类句柄之后，父类句柄只能访问父类的相关变量或方法。可以使用$cast()将父类句柄转换为一个子类句柄
