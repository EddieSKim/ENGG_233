class Guage// spelled gauge wrong
{
  float Min;
  float Max;
  float CurrentValue;
  float Units;
  int position;
  int size;
  String Direction;
  
Guage()
{
}

Guage( String a)
{
  Direction =a; 
}
  

  void Value(float a)
  {    
    if ( a >= Min || a <= Max )
      CurrentValue = a;
  }

  

void FuelBar(float fl, int TC)
{
  fill(255);
  rect(987, 659, 345-(345-(345*(fl/TC))),25);
  
}

void txt(float speed, int RPM, float fuel)
{
  
  //speed= Math.round(speed*10)/10;
  
  PFont mono;
  mono = createFont ("BlackOpsOne-Regular.ttf",70);
  textFont(mono); 
  textAlign (CENTER, CENTER);
  
  fill(255);
  text(speed, 590, 430);
  text(RPM, 1150, 515);
 
  fill(255,0,0);
  mono = createFont ("BlackOpsOne-Regular.ttf",20);
  textFont(mono); 
  textAlign (CENTER, CENTER);
  text(fuel, 1150, 668);
}

void DisDirect(int x, int y)
{
  PFont mono;
  mono = createFont ("BlackOpsOne-Regular.ttf",70);
  textFont(mono); 
  textAlign (CENTER, CENTER);
  fill(255);
  text(Direction, x, y);  
}

}
