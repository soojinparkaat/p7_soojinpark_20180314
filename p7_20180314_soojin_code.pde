var x, y;
let s = 100;
let w = 1;
let n = 0.02;

function setup() {
    createCanvas(windowWidth, windowHeight);
    background(255);
    noFill();
    change = 0;
}

function draw() {  
    buttonsave = createButton('save');
    buttonsave.position(10, 10);
    buttonsave.mousePressed(savelogo);
  
   translate(mouseX, mouseY);
  if (mouseIsPressed && mouseButton == LEFT){
 
   stroke(color(random(205, 255), random(105, 255), random(20, 255)));
    beginShape();
    strokeWeight(w);
    for (var i = 0; i < 600; i++) {
        var ang = map(i, 2900, 2600, 0, PI);
        var rad = s * noise(i * n, change * 0.005);
        x = rad * sin(ang);
        y = rad * cos(ang);
        curveVertex(x, y);

    }
    endShape(CLOSE);

    change += 5;

  }

}

function keyPressed(){
  if (keyCode == UP_ARROW) s+=20;
  if (keyCode == DOWN_ARROW) s-=20; 
  if (keyCode == LEFT_ARROW) w-=1;
  if (keyCode == RIGHT_ARROW) w+=1;
  if (keyCode == DELETE || keyCode == BACKSPACE) clear(); 
  if (keyCode == TAB) {
    background (0); 
    n = 0.17;
    s-=30;
  }
  else if (keyCode == SHIFT) {
    background (255); 
    colorMode (SCREEN);
    
    n = 0.02;
}}

function savelogo(){
    save('noise art.jpg');
  }
