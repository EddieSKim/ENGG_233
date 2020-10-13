class TripComputer
{
  float RPM;
  float gearRatio;
  float totalTravelledDistance;
  float s;
  float UTD;

  TripComputer()
  {}
  
  TripComputer(int a, float b)
  {
    RPM = a;
    gearRatio = b;
  }

  float GS(int x )
  {
    if (x == 0)
    {
      s = (RPM/60)*(1/gearRatio)*2*PI*0.23*3.6;
      return s;
    } 
    else
    {
      s = (RPM/60)*(1/gearRatio)*2*PI*0.254*3.6;
      return s;
    }
  }

  float updateTotalDistance(float x)
  {
    UTD = x+(s/3600);
    return UTD;
  }
}
