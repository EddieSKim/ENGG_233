class FComputer
{
   float fuelEcon;
   float FuelL;
   float fuelConsum;
   float range;  
   float [] fEconH = new float [0];
   int sec;
   
   float AveEcon;
   float AveFC;
   
   FComputer()//default constructor
   {
   }
   
   FComputer(float x, int y, float z)
   {
     fuelConsum = x;
     sec = y;
     FuelL = z;
   }
   
   float [] CfEconH(float [] a,  float b)
   {
     fEconH = splice (a,b/fuelConsum, sec);
     return fEconH; 
   }
   
   void FECON(float x, float y)
   {
     fuelEcon = x/y;
     println("FuelEcon: " + fuelEcon);
   }
   
   void AveFuelEcon()
   {
     
     float store = 0;
     if (sec < 60)
     {
       for(int i = 0; i < fEconH.length; i++)
       {
         if(Float.isInfinite(fEconH[i]))
         {
         }
         else
         {
           store += fEconH[i];
         }
       AveEcon = store/(i+1);
       }
     }     
     else
     {
       for(int i = fEconH.length - 60; i <fEconH.length; i++)
       {
        if(Float.isInfinite(fEconH[i]))
         {
         }
         else
         {
           store += fEconH[i];
         }
       }
           AveEcon = store/60;

     }
     println("AVE_Economy: " + AveEcon);
     
   }   
   void CFuel()
   {
     AveFC = 100/AveEcon;
   }
   
   void GRD()
   {
     println("f" + FuelL);
     range = AveEcon*FuelL;
   }     
}
