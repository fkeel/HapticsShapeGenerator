//Button (well, actually toggle) object
//flexible objects that can be used for constructing GUIs
//Code by Paul Strohmeier (paul.strohmeier@gmail.com)

//some buttons to do stuff with
vSlider[] sliders;

//font to make things look nice
PFont font;

//we'll be using the variables below to manipulate the background color
int redValue = 0;
int greenValue = 0;
int blueValue = 0;
 int samplingRate = 600; 
void setup() {
  font = createFont("arial", 18); //this is just for easthetics. 
  textFont(font);

  size(1400, 600);

 
  sliders = new vSlider[samplingRate];
  //initializing the buttons. The text is formatted like this: "name of button: button hotkey"
  for (int i = 0; i < samplingRate; i++) {
    sliders[i] = new vSlider();
    float period = PI * 2;
    float Hz = 40*0.025; //<---- fraction of second

    float value = sin(float(i)/sliders.length*period*Hz);
    
     Hz = 120*0.025; //<---- fraction of second

    value = value*4 + sin(float(i)/sliders.length*period*Hz)*0.7;
     Hz = 360*0.025; //<---- fraction of second

   value = value*2 + sin(float(i)/sliders.length*period*Hz);
     Hz = 1080*0.025; //<---- fraction of second

   value = value*2 + sin(float(i)/sliders.length*period*Hz);
    value =  map(value,-16,16,0,1);
     sliders[i].setSliderValue(value);
  }
}



void draw() {
  //set the background
  noStroke();
  background(redValue, greenValue, blueValue);
  for (int i = 0; i < samplingRate; i++) {
    
    sliders[i].display(width/(samplingRate)*i, 50, width/(samplingRate), 500);
  }
  
   for (int i = 0; i < 200; i++) {
   // print(nf(sliders[i].getSliderValue(), 1,2));
   // print(", ");
  }
  
  println();
    println();
      println();
}