pragma SPARK_Mode (On);

with AS_Io_Wrapper; use AS_Io_Wrapper;

package body Decrement is

   function dec (input : Num) return Num is
      output : Num;

   begin
      output.d1 := input.d1;
      output.d2 := input.d2;

      if input.d3 > 0 then
         output.d3 := input.d3 - 1;
      else
         output.d3 := 9;
         if input.d2 > 0 then
            output.d2 := input.d2 - 1;
         else
            output.d2 := 9;
            if input.d1 > 0 then
               output.d1 := input.d1 - 1;
            else
               output.d1 := 9;
            end if;
         end if;
      end if;

      return output;
   end dec;

   procedure decProc (input : in out Num) is

   begin

      if input.d3 > 0 then
         input.d3 := input.d3 - 1;
      else
         input.d3 := 9;
         if input.d2 > 0 then
            input.d2 := input.d2 - 1;
         else
            input.d2 := 9;
            if input.d1 > 0 then
               input.d1 := input.d1 - 1;
            else
               input.d1 := 9;
            end if;
         end if;
      end if;
   end decProc;

   procedure run is
      i1     : Integer;
      i2     : Integer;
      i3     : Integer;
      X      : Num;
      output : Num;

      valid : Boolean;

   begin

      --valid := False;

      -- First we initialise standard_input and standard output
      AS_Init_Standard_Output;
      AS_Init_Standard_Input;
      AS_Put_Line ("Decrementing 3 digit integer");

      loop
         -- Print on screen "Type in some number"
         AS_Put_Line ("Type in first digit");
      -- ask for an  integer (in variable i1) until an integer has been entered
         --   if something else has been entered ask again
         AS_Get (i1, "Please type in an integer; please try again");

         if i1 < 0 or i1 > 9 then
            valid := False;
         else
            valid := True;
         end if;

         exit when valid;
      end loop;

      loop
         AS_Put_Line ("Type in second digit");
         AS_Get (i2, "Please type in an integer; please try again");
         if i2 < 0 or i2 > 9 then
            valid := False;
         else
            valid := True;
         end if;

         exit when valid;
      end loop;

      loop
         AS_Put_Line ("Type in third digit");
         AS_Get (i3, "Please type in an integer; please try again");

         if i3 < 0 or i3 > 9 then
            valid := False;
         else
            valid := True;
         end if;

         exit when valid;
      end loop;

      X.d1 := Digit (i1);
      X.d2 := Digit (i2);
      X.d3 := Digit (i3);

      output := Decrement.dec (X);
      Decrement.decProc (X);

      AS_Put_Line ("Function:");
      AS_Put_Line
        ((Integer (output.d1) * 100) + (Integer (output.d2) * 10) +
         Integer (output.d3));
      AS_Put_Line ("Procedure:");
      AS_Put_Line
        ((Integer (X.d1) * 100) + (Integer (X.d2) * 10) + Integer (X.d3));

      null;
   end run;

end Decrement;
