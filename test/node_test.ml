
open Core.Std
(* open Option.Monad_infix *)
open OUnit

let test_create () =
  let module Node = Jy_node in

  let node_a = 
    Node.create ~name:"All your bases" ()
  in 
  let node_b = 
     Node.create ~name:"Are belong to us" ~parent:node_a ()
  in
  print_endline @@ Node.to_string node_a ;
  ignore node_a ;
  ignore node_b

let test_id_of_node () =
  ()



let test_fixture  = 
  "Jy_node" >:::
  [
    "create"     >:: test_create ;
    "id_of_node" >:: test_id_of_node ;
  ]
 

(* Test Runner; ~verbose:true gives info on succ tests *)
let _ = 
  run_test_tt ~verbose:false test_fixture
  |> List.iter ~f:begin function
     | RFailure (_,_) -> exit 1
     | RError (_,_)   -> exit 1
     | RTodo (_,_)    -> exit 1
     | _              -> ()
     end

