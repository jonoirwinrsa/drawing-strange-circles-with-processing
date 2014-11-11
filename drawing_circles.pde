int numPoints = 10;
int numRepeats = 10;

PVector [][] points = new PVector[numRepeats][numPoints+2];

float radius = 150;

void setup()
{
    size( 1366, 768 );
    
    float angle = TWO_PI / numPoints;
    
    for (int j = 0; j < numRepeats; j++) {
        float noise1 = j*random(-.1,.1);
      for (int i = 0; i < numPoints+2; i++) {
          
        float noise2 = random(-j*5,j*5);
          float noise = j*random(-.1,.1)+random(-noise1,noise1);
          float x = cos( angle * i ) * radius+noise+noise2;
          float y = sin( angle * i ) * radius+noise+noise2;;
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
    
    translate( width/2, height/2);
    
    for (int i = 0; i < numRepeats; i++) {
        for (int j = 0; j < numPoints+1; j++) {
            //if ( j != i ) {
              int noise = i*int(random(10));
                line( points[i][j].x, points[i][j].y, points[i][j+1].x, points[i][j+1].y );        
            //}
        }
    }
    
  save(hour()+""+minute()+""+second()+"__"+day()+""+month()+""+year()+".png"); //save the image as a PNG with a unique timestamped name
    
}
