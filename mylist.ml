type 'a t = 'a list

module Monoid = struct
  type 'a t = 'a list
  let empty = []
  let (<+>) = List.append
end
