private double fractionLength = .74; 
private int smallestBranch = 10; 
private double branchAngle = .3;  
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(#F50000);
  ellipse(320,240,450,450);
  stroke(0,0,0);
  strokeWeight((int)(100/smallestBranch));   
  line(320,460,320,380);   
  drawBranches(320,380,100,3*Math.PI/2); 
} 
public void mousePressed(){
  redraw();
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = (10-Math.random())/9.2*(angle+branchAngle);
   double angle2 = (10-Math.random())/9.8*(angle-branchAngle);
  branchLength*= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  stroke(0,0,0);
  strokeWeight((int)(branchLength/smallestBranch));

  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);


  if(branchLength>smallestBranch){
      drawBranches(endX1,endY1,branchLength-fractionLength,angle1);
      drawBranches(endX2,endY2,branchLength-fractionLength,angle2);
  }
}
