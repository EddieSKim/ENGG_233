class FTank
{
  float TCapacity;
  float FLevel;
  
  FTank(int a,float b)
  {
    TCapacity = a;
    FLevel = b;
  }
  float getConsumedFuel(float x)
  {
    return x - FLevel;
  }
}
