int numPoints = 100;
int numRepeats = 40;

PVector [][] points = new PVector[numRepeats][numPoints+2];

float radius = 150;

void setup()
{
    size( 1366, 768 );
    
    float angle = TWO_PI / numPoints;
    
    for (int j = 0; j < numRepeats; j++) {
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
    
    translate( 800, 400);
    
    for (int i = 0; i < numRepeats; i++) {
       translate( (numRepeats-i)*random(-1,1)+i/10, (numRepeats-i)*random(-1,1)+i/10);
        for (int j = 0; j < numPoints+1; j++) {
              int noise = i*int(random(10));
                line( points[i][j].x, points[i][j].y, points[i][j+1].x, points[i][j+1].y );      
        }
    }
    
  save(/images/hour()+""+minute()+""+second()+"__"+day()+""+month()+""+year()+".png"); //save the image as a PNG with a unique timestamped name
    
}
