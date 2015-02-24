module type S = sig
  type 'a t
  val fmap : ('a -> 'b) -> 'a t -> 'b t
end

module List : S with type 'a t = 'a list = struct
  type 'a t = 'a list
  let fmap = List.map
end

module Option : S with type 'a t = 'a option = struct
  type 'a t = 'a option

  let fmap f = function
    | None -> None
    | Some x -> Some (f x)
end
