
//for selecting a range

//needs some method of entering a precise value by keyboard
//maybe also constraining it to certain step sizes (using integer instead of float might already fix stuff


//a slider is a button that does not toggle, instead it returns a value
//rangeMix & rangeMax are in percentages, a float between 0 & 1
public class RangedSlider extends Slider {
  float rangeMin;
  float rangeMax;
  boolean maxActive;
  boolean minActive;



  //constructor without position
  RangedSlider(String nameShortcut) {
    super(nameShortcut);
    sliderValue = 0;
    sliderMin = 0;
    sliderMax = 0;
    active= false;
    rangeMin = 0.25;
    rangeMax = 0.75;
    maxActive = false;
    minActive = false;
  }

  //specify what range is selected
  void assignRange(int min, int max) { 
    rangeMin = min;
    rangeMax = max;
  }



  //alternate constructor, if we want to give it new coordinates
  void display(int x, int y, int w, int h) {
    buttonX = x;
    buttonY = y;
    buttonWidth = w;
    buttonHeight = h;

    fill(state? boxActive:boxInactive); //color of rectangle
    rect(buttonX, buttonY, buttonWidth, buttonHeight);

    fill(handle);
    stroke(255, 0, 0);
    rect(buttonX+(rangeMax*buttonWidth), buttonY, (rangeMin*buttonWidth)-(rangeMax*buttonWidth), buttonHeight);
    // rect(buttonX+(rangeMin*buttonWidth)-5, buttonY, 10, buttonHeight);

    if (this.checkMouse) {
      this.activateClick();
    }
    if (this.checkKey) {
      this.activateKey();
    }
  }


  void activateClick() { //instead of toggling, we move the slider
    //if the mouse is not being pressed, make sure everything is deactivated
    if (!mousePressed) {
      active = false;
      maxActive = false;
      minActive = false;
    }

    //check if clicking should do anything (only if the mouse is hovering in the correct space
    if (!mousePressed && super.hover()) {
      readyForClick = true;
    } else if (!mousePressed) {
      readyForClick = false;
    }


    //if click should do something, activate the slider
    if (mousePressed &&  readyForClick) {
      active= true;


      //if the slider is active
      //check if the user clicked within either of the handles
      if ((mouseX < buttonX+rangeMax*buttonWidth+5) && (mouseX > buttonX+rangeMax*buttonWidth-5) ) {
        active= true;
        maxActive = true;
      }

      if ((mouseX < buttonX+rangeMin*buttonWidth+5) && (mouseX > buttonX+rangeMin*buttonWidth-5)  ) {
        active= true;
        minActive = true;
      }
    }


    //if either of the handles are axtive, use them to update stuff

    if (mousePressed && maxActive && mouseX>buttonX && mouseX < buttonX+buttonWidth) {
      minActive = false;
      rangeMax = float(mouseX-buttonX)/buttonWidth; 
      sliderPosition = mouseX - buttonX;
      fill(255, 0, 0);
      text(str(rangeMax), mouseX+10, mouseY + 10); //add the value, so you know what you're doing
    } else if (mousePressed && minActive  && mouseX>buttonX && mouseX < buttonX+buttonWidth) {
      maxActive = false;
      rangeMin = float(mouseX-buttonX)/buttonWidth; 
      sliderPosition = mouseX - buttonX;
      fill(255, 0, 0);
      text(str(rangeMin), mouseX+10, mouseY + 10); //add the value, so you know what you're doing
    }
    
     if (displayName) {
      fill(state? textActive:textInactive); //color of name
      text(buttonName, buttonX+nameOffsetX, buttonY+nameOffsetY+buttonHeight);
      // fill(state? highGreen:highRed);  //color of hotkey
    }
  }


  boolean isSliderActive() {
    return active;
  }
  float getMin() { //here we ask what its value is
    return rangeMin;
  }

  float getMax() { //here we ask what its value is
    return rangeMax;
  }
}