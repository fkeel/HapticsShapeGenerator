
//for the haptics thing

//needs some method of entering a precise value by keyboard
//maybe also constraining it to certain step sizes (using integer instead of float might already fix stuff


//a slider is a button that does not toggle, instead it returns a value
//rangeMix & rangeMax are in percentages, a float between 0 & 1
public class vSlider extends Slider {


  //constructor without position
  vSlider() {
    super(" : ");
    sliderPosition = int(buttonHeight*0.5)+buttonY;
  }



  void display(int x, int y, int w, int h) {
    buttonX = x;
    buttonY = y;
    buttonWidth = w;
    buttonHeight = h;
    //sliderPosition = int(buttonHeight*sliderValue)+buttonY; // <---- initializing, helps

    fill(state? boxActive:boxInactive); //color of rectangle
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    stroke(255, 0, 0);
    fill(handle);
    //  rect(buttonX, sliderPosition-2, buttonWidth, 4);
    noStroke();
    rect(buttonX, buttonY+float(buttonHeight/2), buttonWidth, sliderPosition-(buttonHeight)-11);
    // rect(buttonX, sliderPosition-2 4, buttonWidth);

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


  void activateClick() { //instead of toggling, we move the slider




    if (mousePressed && super.hover()) { //if we press down, the slider becomes active
      active = true;

      if (mouseY>buttonY && mouseY < buttonY+buttonHeight) {

        if ((mouseX>buttonX) && (mouseX < buttonX+buttonWidth)) {
          fill(0);
          sliderPosition = mouseY;
          this.getSliderValue(); //add the value, so you know what you're doing
        } else {
          fill(255);
        }
      }
      fill(255);


      clicked = true;
    } else {
      active = false;
    }
  }


  float getSliderValue() { //here we ask what its value is
    sliderValue = map(sliderPosition, buttonY, buttonY+buttonHeight, sliderMin, sliderMax);
    return sliderValue;
  }
}