
//TODO: needs a 'void setSliderValue(int x)' function
//needs some method of entering a precise value by keyboard
//maybe also constraining it to certain step sizes (using integer instead of float might already fix stuff

//slider value is in percent (float between 0 and 1)
//slider POSITION is pixels (int between sliderMin and sliderMax);

//might need some more options to edit the handle appearence

//a slider is a button that does not toggle, instead it returns a value
public class Slider extends Button {
  float sliderValue;
  int sliderMin;
  int sliderMax;
  int sliderPosition;
  boolean active;
   color handle = color(255,255,255);


  //constructor without position
  Slider(String nameShortcut) {
    super(nameShortcut);
    sliderValue = 0.5;
    sliderMin = 0;
    sliderMax = 1;
    sliderPosition = int(buttonWidth*sliderValue)+buttonX;
    active= false;
  }



  //create the slider
  void display(int x, int y, int w, int h) {
    buttonX = x;
    buttonY = y;
    buttonWidth = w;
    buttonHeight = h;
    sliderPosition = int(buttonWidth*sliderValue)+buttonX;

    fill(state? boxActive:boxInactive); //color of rectangle
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    stroke(255, 0, 0);
    fill(handle);
    rect(sliderPosition-2, buttonY, 4, buttonHeight);

    if (this.checkMouse) {
      this.activateClick();
    }
    if (this.checkKey) {
      this.activateKey();
    }
     if (displayName) {
      fill(state? textActive:textInactive); //color of name
      text(buttonName, buttonX+nameOffsetX, buttonY+nameOffsetY+buttonHeight);
      // fill(state? highGreen:highRed);  //color of hotkey
    }
  }


  void setSliderValue(float target) {
    sliderValue = target;
  }

  // not sure what to use the keyboard shortct for. kinda pointless here
  //I changed it around, so the curser can drift out of the slider
  void activateClick() { //instead of toggling, we move the slider

   if (!mousePressed && super.hover()) { //if the mouse is hovering over the GUI element
      readyForClick = true;
    } else if (!mousePressed) { //and if the mouse is not pressed
      readyForClick = false;
    }
    //then we can click it to activate the button


    if (mousePressed && readyForClick) { //if we press down, the slider becomes active
      active= true;
      if (mouseX>buttonX && mouseX < buttonX+buttonWidth) {
        if ((mouseY<buttonY) || (mouseY> buttonY+buttonHeight)) {
          fill(0);
        } else {
          fill(255);
        }

        sliderPosition = mouseX;
        text(str(this.getSliderValue()), mouseX+10, mouseY + 10); //add the value, so you know what you're doing
      }
      fill(255);


      clicked = true;
    } else {
      active = false;
    }
  }

  boolean sliderActive() {
    return active;
  }
  float getSliderValue() { //here we ask what its value is
    sliderValue = map(sliderPosition, buttonX, buttonX+buttonWidth, sliderMin, sliderMax);
    return sliderValue;
  }
  
   void handleFill(int a, int b, int c) {
    handle = color(a, b, c);
  }
  
   void handleFill(int a, int b, int c, int d) {
    handle = color(a, b, c, d);
  }
}