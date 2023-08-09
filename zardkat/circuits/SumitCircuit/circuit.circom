pragma circom 2.0.0;

/*This circuit template verifies the circuit given in poly advance mod 3*/  

template SumitCircuit () {  
     //signal inputs
     signal input a ;
     signal input b;

     // signal input from gates
     signal x;
     signal y;

     // final signal output 
     signal output q;

     // components used in the circuit
     component andGate = AND();
     component orGate = OR();
     component notGate = NOT();

     //circuit logic 
              
     andGate.a <== a;
     andGate.b <== b;  //logic for and gate 
     x <== andGate.out ;

     notGate.in <== b;  // logic for not gate
     y <== notGate.out;

     orGate.a <== x;
     orGate.b <== y;  // logic for or gate 
     q <== orGate.out;// this is our final signal output 
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}


component main = SumitCircuit();