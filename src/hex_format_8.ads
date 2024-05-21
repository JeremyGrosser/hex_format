--
--  Copyright (C) 2024 Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Generic_Hex_Format;
with Interfaces;

package Hex_Format_8 is new Generic_Hex_Format
   (Interfaces.Unsigned_8, Interfaces.Shift_Right);
