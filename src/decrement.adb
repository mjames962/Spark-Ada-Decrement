package body Decrement is 
   o1 : Integer;
   o2 : Integer;
   o3 : Integer;

   function dec (i1, i2, i3 : in Integer) return Integer is
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

      return (o1 * 100) + (o2 * 10) + o3;
   end dec;
   

end Decrement;
