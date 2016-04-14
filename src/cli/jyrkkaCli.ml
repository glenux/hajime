open Core.Std

type cli_action_t = 
    | CliNone
    | CliMerge of string
    | CliLoad of string

let parse_cmdline () = 
    let open Arg in

    (* default values *)
    let conf_verbose = ref false in 
    let conf_action = ref CliNone in


let speclist = [
    ("-b", Arg.Set somebool, ": set somebool to true");
    ("-s", Arg.Set_string somestr, ": what follows -s sets some string");
    ("-d", Arg.Set_int someint, ": some int parameter");
]

let _ = 
    Arg.parse speclist
        (fun x -> raise (Arg.Bad ("Bad argument : " ^ x)))
        usage;
    print_string "Patoune"

