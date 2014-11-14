/*
Author:			Jonathan Irwin
Purpose:		See readme
*/

int numPoints = 100;		//the number of points to create on the polygon
int numRepeats = 40;		//the number of times to draw the entire shape

PVector [][] points = new PVector[numRepeats][numPoints+2];		//create an array to hold all the points on the polygon

float radius = 150; 		//obvs - the size

void setup()
{
    size( 1366, 768 );		//my resolution
    
    float angle = TWO_PI / numPoints;		//the angle required between each line
    
    for (int j = 0; j < numRepeats; j++) {		//create all the points on the circle, could make this easier than working it all out twice by just moving the orig shape - but this way works too
      for (int i = 0; i < numPoints+2; i++) {
          float x = cos( angle * i ) * radius;
          float y = sin( angle * i ) * radius;
          points[j][i] = new PVector( x, y );
      }
    }
    noLoop();
}

void draw()
{
    smooth();
    background(255);
    fill(0);
    stroke(0, 100);
    
    translate( 800, 400);		//starting position
    
    for (int i = 0; i < numRepeats; i++) {
       translate( (numRepeats-i)*random(-1,1)+i/10, (numRepeats-i)*random(-1,1)+i/10);
        for (int j = 0; j < numPoints+1; j++) {
              int noise = i*int(random(10));
                line( points[i][j].x, points[i][j].y, points[i][j+1].x, points[i][j+1].y );		//where the real magic happens, this is where the lines are drawn between the points in the array
        }
    }
    
  save("/images/"+hour()+""+minute()+""+second()+"__"+day()+""+month()+""+year()+".png"); //save the image as a PNG with a unique timestamped name
    
}
