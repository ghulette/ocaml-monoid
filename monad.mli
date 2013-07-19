module type S = sig
  type 'a t
  val return : 'a -> 'a t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
end

module Generic (M : S) : sig
  val join : 'a M.t M.t -> 'a M.t
  val sequence : 'a M.t list -> 'a list M.t
  val map : ('a -> 'b M.t) -> 'a list -> 'b list M.t
  val fold : ('a -> 'b -> 'a M.t) -> 'a -> 'b list -> 'a M.t
end

module LeftMonoid (M : S) (O : Monoid.S) : Monoid.S
module RightMonoid (M : S) (O : Monoid.S) : Monoid.S
