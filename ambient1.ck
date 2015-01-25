TriOsc s => LPF f1 => NRev rev1 => dac;
TriOsc t => LPF f2 => NRev rev2 => dac;
TriOsc u => LPF f3 => PRCRev rev3 => dac;
float sf;
float tf;
float uf;
float scur;
float tcur;
400 => int slide;
0.08 => s.gain;
0.08 => t.gain;
0.1 => u.gain;
0.1 => rev1.mix;
0.1 => rev2.mix;
0.2 => rev3.mix;
4 => f1.Q;
770 => f1.freq;
4 => f2.Q;
770 => f2.freq;
3 => f3.Q;
600 => f3.freq;
[60.0,62.0,64.0,67.0,69.0,72.0] @=> float foo[];
2 => uf;
while(true){
	foo[Math.random2(0,5)] => sf;
	foo[Math.random2(0,5)] => tf;
	while(tf == sf){
		foo[Math.random2(0,5)] => tf;
	}
	if(uf == 2){
		u.freq(Std.mtof(foo[Math.random2(0,4)] - 24));
		0 => uf;
	}
	s.freq() => scur;
	t.freq() => tcur;
	if(scur == tf && tcur == sf){
		scur => sf;
		tcur => tf;
	}
	Math.random2(70, 400) => slide;
	for(0 => int x; x < slide; x++){
		s.freq(scur + (Std.mtof(sf) - scur) * x / slide);
		t.freq(tcur + (Std.mtof(tf) - tcur) * x / slide);
		1::ms => now;
	}
	1 +=> uf;
	(960 - slide)::ms => now;
}