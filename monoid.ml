module type S = sig
  type t
  val empty : t
  val ( <+> ) : t -> t -> t
end

module Generic (M : S) = struct
  let concat ms = 
    M.(List.fold_right (<+>) ms empty)
end

module Sum = struct
  type t = int
  let empty = 0
  let (<+>) = (+)
end

module Prod = struct
  type t = int
  let empty = 1
  let (<+>) = ( * )
end

module Any = struct
  type t = bool
  let empty = false
  let (<+>) = (||)
end

module All = struct
  type t = bool
  let empty = true
  let (<+>) = (&&)
end

module Pair (M1 : S) (M2 : S) = struct
  type t = M1.t * M2.t
  let empty = (M1.empty,M2.empty)
  let (<+>) (x1,y1) (x2,y2) = (M1.(x1 <+> x2),M2.(y1 <+> y2))
end

module Dual (M : S) = struct
  type t = M.t
  let empty = M.empty
  let (<+>) x1 x2 = M.(x2 <+> x1)
end

module Endo (M : Base.Typed) = struct
  type t = M.t -> M.t
  let empty = fun x -> x
  let (<+>) f g = fun x -> g (f x)
end
