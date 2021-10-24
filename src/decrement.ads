pragma SPARK_Mode (On);

package Decrement is

   type Digit is new Integer range 0 .. 9;

   type Num is record
      d1 : Digit;
      d2 : Digit;
      d3 : Digit;
   end record;

   function dec (i1, i2, i3 : in Digit) return Integer;

   procedure run;

end Decrement;
