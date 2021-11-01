pragma SPARK_Mode (On);

package Decrement is

   type Digit is new Integer range 0 .. 9;

   type Num is record
      d1 : Digit;
      d2 : Digit;
      d3 : Digit;
   end record;

   function dec (input : Num) return Num with
      Post =>
      (input.d1 = 0 and input.d2 = 0 and input.d3 = 0 and dec'Result.d1 = 9 and
       dec'Result.d2 = 9 and dec'Result.d3 = 9) or
      (((Integer (input.d1) * 100) + (Integer (input.d2) * 10) +
        Integer (input.d3)) =
       ((Integer (dec'Result.d1) * 100) + (Integer (dec'Result.d2) * 10) +
        Integer (dec'Result.d3) + 1));

   procedure decProc (input : in out Num) with
      Depends => (input => input),
      Post    =>
      ((Integer (input.d1) * 100) + (Integer (input.d2) * 10) +
       Integer (input.d3)) =
      ((Integer (input'Old.d1) * 100) + (Integer (input'Old.d2) * 10) +
       Integer (input'Old.d3) - 1) or
      (input'Old.d1 = 0 and input'Old.d2 = 0 and input'Old.d3 = 0 and
       input.d1 = 9 and input.d2 = 9 and input.d3 = 9);

   procedure run;

end Decrement;
