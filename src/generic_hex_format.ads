--
--  Copyright (C) 2024 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
generic
   type Element_Type is mod <>;

   with function Shift_Right
      (Value  : Element_Type;
       Amount : Natural)
      return Element_Type;
package Generic_Hex_Format
   with Pure
is
   subtype Hex_String is String (1 .. Element_Type'Size / 4);

   function Hex
      (Value : Element_Type)
      return Hex_String;
end Generic_Hex_Format;
