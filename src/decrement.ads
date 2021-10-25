pragma SPARK_Mode (On);

package Decrement is

   type Digit is new Integer range 0 .. 9;

   type Num is record
      d1 : Digit;
      d2 : Digit;
      d3 : Digit;
   end record;

   function dec (input : Num) return Num;

   procedure decProc (input : in out Num);

   procedure run;

end Decrement;
