(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2012     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

type t = int

external equal : int -> int -> bool = "%eq"

external compare : int -> int -> int = "caml_int_compare"

let hash i = i land 0x3FFFFFFF

module Self =
struct
  type t = int
  let compare = compare
end

module Set = Set.Make(Self)
module Map = CMap.Make(Self)

module List = struct
  let mem = List.memq
  let assoc = List.assq
  let mem_assoc = List.mem_assq
  let remove_assoc = List.remove_assq
end
