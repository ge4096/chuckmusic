SinOsc b => LPF f => dac;
b.gain(0.5);
f.freq(500);
f.Q(0.3);
while(true){
	for(0 => int i; i < 480; i++){
		b.freq(Math.exp(-0.4 * i) * 400 + 44);
		1::ms => now;
	}
}