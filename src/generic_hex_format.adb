--
--  Copyright (C) 2024 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
package body Generic_Hex_Format is

   type Hex_Index is range 0 .. 15;
   Hex_Digits : constant array (Hex_Index) of Character := "0123456789ABCDEF";

   function Hex
      (Value : Element_Type)
      return Hex_String
   is
      S : Hex_String;
      N : Natural := 0;
   begin
      for I in reverse S'Range loop
         S (I) := Hex_Digits (Hex_Index (Shift_Right (Value, N) and 16#F#));
         N := N + 4;
      end loop;
      return S;
   end Hex;

end Generic_Hex_Format;
