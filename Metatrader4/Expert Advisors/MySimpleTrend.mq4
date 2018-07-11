//+------------------------------------------------------------------+
//|                                                MySimpleTrend.mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//|                                                                  |
//| Adapted from the umdy course found here:                         |
//| https://www.udemy.com/mql4-tutorial-bootcamp-trading-robot-coding-in-metatrader4/learn/v4/overview
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
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
   double myMA = iMA(NULL, PERIOD_W1, 14, 5, 0, 0, 0);
   double myOldMA = iMA(NULL, PERIOD_W1, 14, 5, 0, 0, 10); 
   double trend = myMA - myOldMA;
   
   Comment("Trend: ", trend, "\n", "Profit: ", AccountProfit(), "\n", "Equity: ", AccountEquity());
   
   //No open orders and trend is up 
   if(OrdersTotal() == 0 && trend > 0) 
     {
      int ticket = OrderSend(Symbol(), OP_BUY, 0.01, Ask, 3, 0, (Ask + 0.01), "Buy Order", 34522138, 0, clrGreen);
      
      if(ticket<0) 
         Print("OrderSend failed with error #",GetLastError()); 
      else 
         Print("OrderSend placed successfully"); 
     }   
  }
//+------------------------------------------------------------------+
