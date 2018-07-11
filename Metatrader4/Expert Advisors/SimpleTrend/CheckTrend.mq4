//+------------------------------------------------------------------+
//|                                                   CheckTrend.mq4 |
//|                                                   Rene Kernegger |
//|                     https://github.com/rkernegger/Trading-Robots |
//+------------------------------------------------------------------+
#property copyright "Rene Kernegger"
#property link      "https://github.com/rkernegger/Trading-Robots"
#property version   "1.00"
#property strict

//checks if the trend is up or down according to a 14-(insert timeframe) moving average
double CheckTrend(int trendtimeframe) 
  {
   double ma = iMA(NULL, trendtimeframe, 14, 5, 0, 0, 0);
   double oldma = iMA(NULL, trendtimeframe, 14, 5, 0, 0, 10); 
   
   return oldma - ma;
  }