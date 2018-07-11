//+------------------------------------------------------------------+
//|                                                		 MATrend.mq4 |
//|                                                   Rene Kernegger |
//| Adapted from the umdy course found here:                         |
//| https://www.udemy.com/mql4-tutorial-bootcamp-trading-robot-coding-in-metatrader4/learn/v4/overview
//+------------------------------------------------------------------+
#property copyright "Rene Kernegger"
#property link      "https://github.com/rkernegger/Trading-Robots"
#property version   "1.00"
#property strict

#include "CheckTrend.mq4"

extern int TREND_TIME_FRAME = PERIOD_W1;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   double volume = 0.01;
   double price = Ask;
   double stoploss = 0;
   double takeprofit = price + 0.01;
   
   //checks if the trend is up or down according to a 14-(insert timeframe) moving average
   double trend = CheckTrend(TREND_TIME_FRAME);
   
   Comment("Trend: ", trend, "\n", "Profit: ", AccountProfit(), "\n", "Equity: ", AccountEquity());
   
   //No open orders and trend is up 
   if(OrdersTotal() == 0 && trend > 0) 
     {
      int ticket = OrderSend(Symbol(), OP_BUY, volume, price, 3, stoploss, takeprofit, "Buy Order", 34522138, 0, clrGreen);
      
      if(ticket < 0) 
         Print("OrderSend failed with error #",GetLastError()); 
      else 
        {
         Print("OrderSend placed successfully");
         WindowScreenShot("screenshot.gif", 1024, 600); 
        }
     }   
  }
//+------------------------------------------------------------------+
