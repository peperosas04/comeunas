////TAREA FINAL JOSE ANTONIO ROSAS

~dict = Dictionary.new;


~dict.add( \Ampli1 -> 2 );
~dict.add( \Ampli2 -> 5 );
~dict.add( 128 -> [7,3] );


~dict.postln;


~dict[\Ampli1];
~dict[\Ampli2];
~dict[128];


~dict = (\Ampli1: 2,\Ampli2:5, 128:[7,3]);
~dict[\Ampli1];
~dict[\Ampli2];
~dict[128];

~dict = (0: 7, 4:[4,7], 9: 0);
~dict[0];
~dict[4];
~dict[9];



~dict = (0: [0,1], 1:0 );

Prewrite(0,~dict,3).asStream.nextN(10);
Prewrite(0,~dict,4).asStream.nextN(10);

//
(
~dict = (
	0: [0,1],
	1:0
);
Pdef(\linden,
	Pbind(
		\note,Prewrite(0, ~dict, 15).poll,
		\dur, 0.25
	)
).play;
)


(
~dict = (
	0: [2,10,18],
	9:6,
	4: [0,\r],
	5: 0,
	6: [4,9]
);
Pdef(\linden,
	Pbind(
		\note,Prewrite(0, ~dict, 15).poll,
		\dur, 0.2
	)
).play;
)





~dict = (
	0.5: [0.25,0.25,1],
	0.25: [0.5,0.25],
	1:0.5
);
Pdef(\linden,
	Pbind(
		\note, 0,
		\dur, (Prewrite(0.5, ~dict, 5)/2).poll
	)
).play;
)


(
~dictN = (
	0: [9,5,4],
	9:6,
	4: [0,\r],
	5: 0,
	6: [4,9]
);

~dictR = (
	0.5: [0.25,0.25,1],
	0.25: [0.5,0.25],
	1:0.5
);


Routine({
	inf.do({arg i;
		("Iteración "+i).postln;
		Pdef(\linden,
			Pbind(
				\note, (Prewrite(0, ~dictN, i)).poll,
				\dur, (Prewrite(0.5, ~dictR, i)/2).poll
			)
		).play;
		4.wait;
	})
}).play

)

