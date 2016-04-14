open Core.Std

type cli_action_t = 
  | CliNone
  | CliBuild
  | CliLoad 

let parse_cmdline () = 
  let open Arg in

  (* default values *)
  let conf_verbose = ref false in 
  let conf_action = ref CliNone in

  let parse_action = function 
    | "merge" -> conf_action := CliBuild
    | "load" -> conf_action := CliLoad 
    | _ -> conf_action := CliNone
  in

  let usage = "usage: " ^ Sys.argv.(0) ^ "[options...]" in 
  let speclist = [
    ("-v", Set conf_verbose,   ": set somebool to true");
    ("-s", String parse_action, ": what follows -s sets some string")
  ] in
  let error_fn arg = raise (Bad ("Bad argument : " ^ arg)) in 

  (* Read the arguments *)
  parse speclist error_fn usage ;

  (* Return a value *)
  ( !conf_action, !conf_action )


let _ = 
  let config = parse_cmdline () in
  print_string "Patoune"

