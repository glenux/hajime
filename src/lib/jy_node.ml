
type node_t = {
    name: string ;
    parent: node_t option ;
    children: node_t list
}

type t = node_t

let create ~name ?parent () = {
    name ;
    parent ;
    children = []
}

let machin () =
    "toto"

