float[] values;

void setup() {
  size(600,600);
}

void draw() {
  background(100,150,150);
  translate(width/2, height/2);
  drawPlane();
  
  // Draw curve of f(x)
  stroke(0);
  for(int x = -width/2; x< width/2; x++) { 
    // Negative f(x) values flip the graph
    line(x, -f(x), x+1, -f(x+1));
  }
  
  newtonApprox();

}

float f(float x) {
  float y;
  
  y = pow(x,2)*0.01;
  
  return y;
}

void newtonApprox() {
    //Draw line between f(x) and x-intercept
  stroke(255,0,0);
  
  float initX = mouseX-width/2;
  // tangent line = y - f(x) = dX(initX)(x - initX)
  float xIntercept = initX - (f(initX)/dX(initX));
  // Negative f(x) values flip the graph
  line(initX, -f(initX), xIntercept, 0 );
  
  //Draw line from x-intercept up to f(x-intercept)
  line(xIntercept, 0, xIntercept, -f(xIntercept));
  
  //Print output for debugging
  println(initX+", "+f(initX)+", dX(initX)="+dX(initX));
}

float dX(float x) {
    float delta = 0.0001;
    
    float x1 = x + delta;
    float x2 = x;
    float y1 = f(x1);
    float y2 = f(x2);
    float derivative = (y1-y2) / (x1-x2);  
    
    return derivative;
  
}

void drawPlane() {
  stroke(1);
  line(0, 0-height, 0 , height);
  line(0-width, 0, width, 0);
}
