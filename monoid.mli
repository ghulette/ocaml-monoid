module type S = sig 
  type t
  val empty : t
  val ( <+> ) : t -> t -> t
end

module Make (M : S) : sig 
  val fold : M.t list -> M.t
  val fold_opt : (M.t -> M.t -> 'a) -> M.t list -> M.t
end

module Sum : S with type t = int
module Prod : S with type t = int
module Any : S with type t = bool
module All : S with type t = bool
module Pair (M1 : S) (M2 : S) : S with type t = M1.t * M2.t
module Dual (M : S) : S with type t = M.t
module Endo (F : sig type t end) : S with type t = F.t -> F.t
module Option (M : S) : S with type t = M.t option
module First (T : sig type t end) : S with type t = T.t option
module Last (T : sig type t end) : S with type t = T.t option
module List (T : sig type t end) : S with type t = T.t list
