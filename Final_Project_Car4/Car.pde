class car
{
  SensorDataProvider SDP = new SensorDataProvider();
  TripComputer TC = new TripComputer();
  FTank FT;
  FComputer fC = new FComputer();
  Guage g4 = new Guage();
  
  int RPM;
  float speed;
  float TravelD;
  float fuelLevel;
  float fuelConsum;
  float ratio;
  
  //Direction
  float GX;
  float GY;
  float dX;
  float dY;
  String Direction = new String();
  
  int i;
  int sec;
 
  car()
  { 
  }
  
  car(int x, int a)
  {
    i = x;
    SDP.Initialize(i);  
    SDP.readNext(a);
    RPM = SDP.readRPM();
    ratio = SDP.readRatio();
    TC = new TripComputer(RPM, ratio);
    speed = TC.GS(x);
    
    fuelLevel = SDP.readFuelLevel();
    GX = SDP.readX();
    GY = SDP.readY();
    SetFT();

  }
  
  void SetFT()
  {
    if (i == 0)
    {
    FT= new FTank(60,fuelLevel);
    }
    else
    {
    FT= new FTank(80,fuelLevel);
    }
    
  }
  
  void setFC()
  {
    fC = new FComputer (fuelConsum, sec,c1[i].fuelLevel);
  }
  
  void GXY(float a, float b)
  {
    dX = GX - a;
    dY = GY - b;
  }
  
  void DIR()
  {
    char Xd;
    char Yd;    
    if (dX > 0)
    {
      Xd = 'E';
    }
    else if( dX < 0)
    {
      Xd = 'W';
    }
    else
    {
      Xd = ' ';
    }
    if (dY > 0)
    {
      Yd = 'N';
    }
    else if(dY < 0)
    {
      
      Yd = 'S';
    }
    else
    {
      Yd = ' ';
    }
    Direction +=Yd;
    Direction +=Xd;
    Direction.replaceAll("\\s","");
}

void GetDi()
{
  g4 = new Guage(Direction);
  g4.DisDirect(270,310);
}
  
}
