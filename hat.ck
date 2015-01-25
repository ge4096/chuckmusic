Noise n => ADSR h => HPF f => dac;
n.gain(0.012);
h.attackTime(1::ms);
h.decayTime(30::ms);
f.freq(6000);
f.Q(3);
h.sustainLevel(0);
while(true){
	240::ms => now;
	h.keyOn();
	240::ms => now;
}
