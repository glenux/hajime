
open Core.Std 

type node_t = {
    name: string ;
    parent: node_t option ;
    mutable children: (node_t list)
}

type t = node_t

let create ~name ?parent () = 
    let node_new = {
        name ;
        parent ;
        children = []
    }
    in
    begin match parent with
    | None             -> ()
    | Some node_parent -> 
        node_parent.children <- (node_new :: node_parent.children) ; ()
    end ;
    node_new

let to_string node = 
    let rec to_string_rec node idt =
        let substr : string = 
            node.children
            |> List.map ~f:begin fun n -> 
                    to_string_rec n (idt ^ "    ")
               end
            |> String.concat ~sep:"\n"
            |> fun x -> begin match (String.length x) with
                | 0 -> idt ^ "<none>"
                | _ -> x
               end
        in
        idt ^ "name: " ^ node.name ^ "\n" ^
        idt ^ "children:\n" ^ substr
    in
    to_string_rec node ""


