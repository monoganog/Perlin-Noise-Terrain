int cols, rows;
int scl = 20;

float flying;

   int w = 3000;
   int h = 4000;
   
float [][] terrain;

void setup(){
  size(600,600,P3D);

   cols = w/ scl;
   rows = h/scl;
   
   terrain = new float[cols][rows];

}

void draw(){
  
  
  float c = map(mouseX, 0, width, -0.1,0);
  
  float d = map(mouseY, 0, height, -150, 1000);
  
  flying -= c;
     float yoff = flying;
   for(int y = 0; y < rows; y++){ 
     float xoff = 0;
      for(int x = 0; x < cols; x++){
        
        terrain[x][y] = map(noise(xoff,yoff),0,1,-150,d);
        xoff += 0.1;
      }
      yoff+= 0.1;
   }
   
   noFill();
  ambientLight(102, 102, 102);
  lightSpecular(204, 204, 204);
directionalLight(102, 102, 102, 0, 0, -1);
specular(255, 255, 255);

shininess(3);
  
  
  
  background(255);
  //stroke(255);
  //lights();
  
  translate(width/2,height/2+200);
  rotateX(-PI/1.7);
  //frameRate(1);
  
  translate(-w/2,-h/2);
  for(int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
      for(int x = 0; x < cols; x++){
      
        vertex(x*scl,y*scl,terrain[x][y]);
        vertex(x*scl,(y+1)*scl,terrain[x][y+1]);
        //rect(x*scl,y*scl,scl,scl);       
        
    }
     endShape();
  }
}
