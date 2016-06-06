
Object structure
================

Tree 
----

```
type t = tree_t
type path_t

val merge : 
    tree:t -> 
    position:? -> 
    subtree:t -> 
    t

val extract : 
    tree:t -> 
    position:path_t -> t
val to_s : tree:t -> string
...
```

Node
----

```
type node_t = 
  ...

type n = node_t
val create : name:? -> parent:? -> (* other properties *) -> n
val id_of_node : n -> ? 
...
```

Patch
-----

```

type patch_t = {
  migrations: (Node.id_t, Tree.t) list

type p = patch_t

```

