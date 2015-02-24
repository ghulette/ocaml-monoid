module type S = sig
    include Functor.S
    val return : 'a -> 'a t
    val (>>=) : 'a t -> ('a -> 'b t) -> 'b t
  end

module Generic (M : S) = struct
  open M

  let join mmx = 
    mmx >>= fun mx -> 
    mx >>= fun x -> 
    return x

  let rec sequence = function
    | [] -> return []
    | m::ms ->
       m >>= fun x ->
       sequence ms >>= fun xs ->
       return (x::xs)

  let map f xs = 
    sequence (List.map f xs)

  let rec fold f x = function
    | [] -> return x
    | y::ys ->
       f x y >>= fun x' ->
       fold f x' ys
end

module LeftMonoid (M : S) (O : Monoid.S) = struct
  type t = O.t M.t
  let empty = M.return O.empty
  let (<+>) m1 m2 =
    let open M in 
    m1 >>= fun x1 ->
    m2 >>= fun x2 ->
    return O.(x1 <+> x2)
end

module RightMonoid (M : S) (O : Monoid.S) = struct
  type t = O.t M.t
  let empty = M.return O.empty
  let (<+>) m1 m2 =
    let open M in  
    m2 >>= fun x2 ->
    m1 >>= fun x1 ->
    return O.(x1 <+> x2)
end
