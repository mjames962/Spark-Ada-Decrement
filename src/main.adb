pragma SPARK_Mode (On);

with AS_Io_Wrapper, Decrement;
use AS_Io_Wrapper, Decrement;

procedure Main is

   i1 : Integer;
   i2 : Integer;
   i3 : Integer;
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
      -- ask for an  integer (in variable X) until an integer has been entered
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

   output := Decrement.dec(i1 => i1,
                           i2 => i2,
                           i3 => i3);

   AS_Put_Line (output);

   null;
end Main;
