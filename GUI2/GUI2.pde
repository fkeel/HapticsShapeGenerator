//Button (well, actually toggle) object
//flexible objects that can be used for constructing GUIs
//Code by Paul Strohmeier (paul.strohmeier@gmail.com)

//some buttons to do stuff with
Slider redButton;
Button greenButton;
Button blueButton;
Button blackWhiteButton;
Button centralButton;

//font to make things look nice
PFont font;

//we'll be using the variables below to manipulate the background color
int redValue = 0;
int greenValue = 0;
int blueValue = 0;

void setup() {
  font = createFont("arial", 18); //this is just for easthetics. 
  textFont(font);

  size(400, 800);
  
  //initializing the buttons. The text is formatted like this: "name of button: button hotkey"
 
  redButton = new Slider("redButton:r");
  greenButton = new Button("greenButton:g");
  blueButton = new Button("blueButton:r");
  blackWhiteButton = new Button("BlackOrWhite:r");
  centralButton = new Button("someOtherButton:x");
 //  redButton.assignRange(1,99);
}



void draw() {
  //set the background
  background(redValue, greenValue, blueValue);

//display the buttons by providing them with x & y coordinate as well as height and width
  redButton.display(150, 200, 100, 60);
  println(redButton.getSliderValue());
  greenButton.display(150, 300, 100, 60);
  blueButton.display(150, 400, 100, 60);
  blackWhiteButton.display(150, 500, 100, 60);
// centralButton.display();

//check if the buttons are clicked and do stuff if they are
  if (blackWhiteButton.isToggled()) {
    redValue = 50;
    greenValue = 50;
    blueValue = 50;
  } else {
    redValue = 190;
    greenValue = 190;
    blueValue = 190;
  }
  if (redButton.isToggled()) {
    redValue = 230;
  }
  if (greenButton.isToggled()) {
    greenValue = 230;
  }
  if (blueButton.isToggled()) {
    blueValue = 230;
  }
    if (centralButton.isToggled()) {
      fill(0,0,200);
       text("this button does not do much", 10,20); 
  }
}