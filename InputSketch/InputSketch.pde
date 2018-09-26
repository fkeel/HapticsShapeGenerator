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

  size(900, 500);

  sliders = new vSlider[100];
  //initializing the buttons. The text is formatted like this: "name of button: button hotkey"
  for (int i = 0; i < 100; i++) {
    sliders[i] = new vSlider();
  }
}



void draw() {
  //set the background
  background(redValue, greenValue, blueValue);
  for (int i = 0; i < 100; i++) {
    sliders[i].display(8*i+10, 100, 7, 180);
  }
}