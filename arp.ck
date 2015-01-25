TriOsc s => ADSR e1 => LPF f1 => Echo d1 => dac;
TriOsc t => ADSR e2 => LPF f2 => Echo d2 => dac;
e1.attackTime(3::ms);
e1.decayTime(50::ms);
e1.sustainLevel(0);
e2.attackTime(7::ms);
e2.decayTime(40::ms);
e2.sustainLevel(0);
f1.freq(4000);
f1.Q(2);
f2.freq(4000);
f2.Q(2);
s.gain(0.045);
t.gain(0.02);
d1.delay(23::ms);
d2.delay(23::ms);
72 => int mainf;
[12.0, 7.0, 4.0] @=> float foo[];
0 => int x;
while(true){
	s.freq(Std.mtof(mainf + foo[x]));
	t.freq(Std.mtof(mainf + foo[x] - 24));
	e1.keyOn();
	e2.keyOn();
	120::ms => now;
	if(x == foo.size() - 1){
		0 => x;
		if(Math.randomf() > 0.9){
			if(foo[0] == 12.0){
				[7.0, 12.0, 4.0] @=> float foo[];
			}
			else{
				[12.0, 7.0, 4.0] @=> float foo[];
			}
		}
	}
	else{
		1 +=> x;
	}
}