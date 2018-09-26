
//for the haptics thing


public class vSlider extends Slider {


  //constructor without position
  vSlider() {
    super(" : ");
    sliderValue = 0.5;
  }



  void display(int x, int y, int w, int h) {
    buttonX = x;
    buttonY = y;
    buttonWidth = w;
    buttonHeight = h;
    sliderPosition = int(buttonHeight*(1 - sliderValue))+buttonY; // <---- initializing, helps

    fill(state? boxActive:boxInactive); //color of rectangle
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    stroke(255, 0, 0);
    fill(handle);
    //  rect(buttonX, sliderPosition-2, buttonWidth, 4);
    noStroke();
    rect(buttonX, buttonY+buttonHeight/2, buttonWidth, (sliderPosition-buttonY)-buttonHeight/2 ); // <--- white indicator
    // rect(buttonX, sliderPosition-2 4, buttonWidth);

    if (this.checkMouse) {
      this.activateClick();
    }
    if (this.checkKey) {
      this.activateKey();
    }
    if (displayName) {
      fill(state? textActive:textInactive); //color of name
     // text(buttonName, buttonX+nameOffsetX, buttonY+nameOffsetY+buttonHeight);
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
    sliderValue = 1 - map(sliderPosition, buttonY, buttonY+buttonHeight, sliderMin, sliderMax);
    return sliderValue;
  }
}