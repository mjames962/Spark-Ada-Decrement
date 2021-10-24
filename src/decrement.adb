pragma SPARK_Mode (On);

with AS_Io_Wrapper; use AS_Io_Wrapper;

package body Decrement is
   o1 : Digit;
   o2 : Digit;
   o3 : Digit;

   X : Num;

   function dec (i1, i2, i3 : in Digit) return Integer is
   begin

      o1 := i1;
      o2 := i2;
      o3 := i3;

      if i3 > 0 then
         o3 := i3 - 1;
      else
         o3 := 9;
         if i2 > 0 then
            o2 := i2 - 1;
         else
            o2 := 9;
            if i1 > 0 then
               o1 := i1 - 1;
            else
               o1 := 9;
            end if;
         end if;
      end if;

      return Integer ((o1 * 100) + (o2 * 10) + o3);
   end dec;

   procedure run is
      i1     : Integer;
      i2     : Integer;
      i3     : Integer;
      output : Integer;

      valid : Boolean;

   begin

      valid := False;

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

      valid := False;

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

      valid := False;

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

      output := Decrement.dec (i1 => X.d1, i2 => X.d2, i3 => X.d3);

      AS_Put_Line (output);

      null;
   end run;

end Decrement;
