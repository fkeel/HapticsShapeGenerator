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

void setup() {
  font = createFont("arial", 18); //this is just for easthetics. 
  textFont(font);

  size(900, 600);
 int samplingRate = 22500; 
 
  sliders = new vSlider[samplingRate];
  //initializing the buttons. The text is formatted like this: "name of button: button hotkey"
  for (int i = 0; i < 22500; i++) {
    sliders[i] = new vSlider();
    float period = PI * 2;
    float Hz = 200;
    float value = sin(float(i)/sliders.length*period*Hz);
    value = (value+1)/2;
     sliders[i].setSliderValue(value);
  }
}



void draw() {
  //set the background
  noStroke();
  background(redValue, greenValue, blueValue);
  for (int i = 0; i < 200; i++) {
    
    sliders[i].display((200/width)*i+2, 50, 200, 500);
  }
  
   for (int i = 0; i < 200; i++) {
   // print(nf(sliders[i].getSliderValue(), 1,2));
   // print(", ");
  }
  
  println();
    println();
      println();
}