module type S = sig type 'a t val fmap : ('a -> 'b) -> 'a t -> 'b t end
module List :
  sig type 'a t = 'a list val fmap : ('a -> 'b) -> 'a t -> 'b t end
module Option :
  sig type 'a t = 'a option val fmap : ('a -> 'b) -> 'a t -> 'b t end
