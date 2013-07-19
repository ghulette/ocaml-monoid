module type S = sig 
  type t
  val empty : t
  val ( <+> ) : t -> t -> t
end

module Generic (M : S) : sig 
  val concat : M.t list -> M.t
end

module Sum : S with type t = int
module Prod : S with type t = int
module Any : S with type t = bool
module All : S with type t = bool
module Pair (M1 : S) (M2 : S) : S with type t = M1.t * M2.t
module Dual (M : S) : S with type t = M.t
