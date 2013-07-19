type 'a t = 'a option

module Monoid (M : Monoid.S) = struct
  type t = M.t option
  let empty = None
  let (<+>) m1 m2 =
    match m1,m2 with
      | Some x1,Some x2 -> Some M.(x1 <+> x2)
      | Some x1,None -> Some x1
      | None,Some x2 -> Some x2
      | None,None -> None
end

module type Typed = sig
  type t
end

module First (M : Typed) = struct
  type t = M.t option
  let empty = None
  let (<+>) m1 m2 =
    match m1,m2 with
      | Some x,Some _ -> Some x
      | Some x,None -> Some x
      | None,Some x -> Some x
      | None,None -> None
end

module Last (M : Typed) = struct
  type t = M.t option
  let empty = None
  let (<+>) m1 m2 =
    match m1,m2 with
      | Some _,Some x -> Some x
      | Some x,None -> Some x
      | None,Some x -> Some x
      | None,None -> None
end

module Monad = struct
  let return x = 
    Some x

  let (>>=) mx f =
    match mx with
      | None -> None
      | Some x -> f x
end
