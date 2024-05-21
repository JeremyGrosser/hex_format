--
--  Copyright (C) 2024 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Ada.Text_IO;
with Interfaces;

with Generic_Hex_Format;
with Hex_Format_32;
with Hex_Format_16;
with Hex_Format_8;

procedure Test is
   A : constant Interfaces.Unsigned_32 := 16#FEED_F00D#;
   B : constant Interfaces.Unsigned_16 := 16#BEEF#;
   C : constant Interfaces.Unsigned_8 := 16#AE#;
begin
   if Hex_Format_32.Hex (A) /= "FEEDF00D" then
      Ada.Text_IO.Put_Line ("Unsigned_32 hex format incorrect");
   end if;

   if Hex_Format_16.Hex (B) /= "BEEF" then
      Ada.Text_IO.Put_Line ("Unsigned_16 hex format incorrect");
   end if;

   if Hex_Format_8.Hex (C) /= "AE" then
      Ada.Text_IO.Put_Line ("Unsigned_8 hex format incorrect");
   end if;

   declare
      type UInt28 is mod 2 ** 28;
      function Shift_Right
         (Value  : UInt28;
          Amount : Natural)
         return UInt28
      is (UInt28
         (Interfaces.Shift_Right
            (Interfaces.Unsigned_32 (Value), Amount)));

      package Hex_Format_28 is new Generic_Hex_Format (UInt28, Shift_Right);
      D : constant UInt28 := 16#BADCAFE#;
   begin
      if Hex_Format_28.Hex (D) /= "BADCAFE" then
         Ada.Text_IO.Put_Line ("UInt28 hex format incorrect");
      end if;
   end;

   Ada.Text_IO.Put_Line ("PASS");
end Test;
