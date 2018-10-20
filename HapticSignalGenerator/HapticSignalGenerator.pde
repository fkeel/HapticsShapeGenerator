

// Sketch for Generating or Drawing haptic Signal
// Creates an array of values to be written to the DAC of a Teensy or similar board
// by paul.strohmeier@gmail.com

//This code is licensed as CC BY-SA 4.0 - You can share & adapt, but must attribute it to paul.strohmeier@gmail.com 


//Sampling Rate (per second)
int samplingRate = 7200; // <------------ ----------- -----------EDIT THIS. Higher numbers required for higher frequency signals

//Sampling Window (in seconds) -- length of haptic signal
float samplingWindow = 0.25; // <------------ ----------- -----------EDIT THIS. Keep this as low as possible

//number of samples in the alloted time window
int sampleCount = int(samplingRate*samplingWindow);

float[] samples = new float[sampleCount];

//for visualizing & drawing the signal
vSlider[] sliders;

float period = PI * 2; //full circle


void setup() {
  size(1800, 600);  //x dimension needs to be multiple of sample rate or display glitches a bit

  sliders = new vSlider[sampleCount];
  //initializing the buttons. The text is formatted like this: "name of button: button hotkey"
  for (int i = 0; i < sampleCount; i++) {
    sliders[i] = new vSlider();
  }

  //generate wave; <------------ ----------- ----------- EDIT THIS. addSine(Frequency, Weight) 
  addSine(40, 6);
  addSine(120, 1);
  addSine(360, 0.16);
  // addSine(1080, 0.027); //values are too small to add properly. needs to be 'double' instead of float (or multiplied by 100 or something
  // addSine(3240, 0.1);
  // addSine(9720, 0.1);
  addSine(4, 20);

  //set values
  float temp;
  float max = max(samples);

  for (int i = 0; i < sampleCount; i++) {
    temp = map(samples[i], -max, max, 0, 1);
    sliders[i].setSliderValue(temp);
  }

  fill(255, 0, 0);
  text("Use mouse to tweak curve, add or remove detail, or redraw - The curve displayed here can be manipulated in line 34 of this sketch - Hit any key to output curve as 11-bit array", 20, 40);
}



void draw() {


  noStroke();
  //display values
  for (int i = 0; i < sampleCount; i++) {
    sliders[i].display((width/sampleCount)*i, 50, (width)/(sampleCount), 500);
  }
}

//maybe also make 'addSaw' and 'addSquare' functions
void addSine(float frequency, float weight) {
  float value = 0;

  for (int i = 0; i < sampleCount; i++) {
    value = sin(float(i)/sliders.length*period*frequency*samplingWindow)*weight;
    samples[i] = samples[i] + value;
  }
}



//print to window
boolean readyForPrint = true;
void keyPressed() {
  //print values
  print("{");
  for (int i = 0; i < sampleCount-1; i++) {
    print(int(sliders[i].getSliderValue()*2048)); //for 11bit DAC output
    print(", ");
  }
  print( int(sliders[sampleCount-1].getSliderValue()*2048));
  print("}");
  println();
  println();
  println();
  println();
  readyForPrint = true;
}

void keyReleased() {
  readyForPrint = true;
}