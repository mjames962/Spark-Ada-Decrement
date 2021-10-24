pragma SPARK_Mode (On);

with AS_Io_Wrapper, Decrement;
use AS_Io_Wrapper, Decrement;

procedure Main is

   valid : Boolean;
   value : Integer;

begin

   loop
      Decrement.run;

      -- First we initialise standard_input and standard output
      AS_Init_Standard_Output;
      AS_Init_Standard_Input;
      AS_Put_Line ("Would you like to enter another 3 digit number?");

      value := 0;
      valid := False;

      loop
         AS_Put_Line ("Enter: YES(1) / NO(0)");
   -- ask for an  integer (in variable value) until an integer has been entered
         --   if something else has been entered ask again
         AS_Get (value, "Please type in an integer; please try again");

         if value = 0 or value = 1 then
            valid := True;
         else
            valid := False;
         end if;

         exit when valid;
      end loop;

      exit when value = 0;
   end loop;

   null;
end Main;
