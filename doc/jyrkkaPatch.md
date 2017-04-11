# JyrkkaPatch - patch management


## patch TREEFILE PATCHFILE

Apply patch PATCH to TREEFILE

## depend-show PATCHFILE [PATCHFILE...]

Show : 
* required paths for PATCHFILE
* provided paths for PATCHFILE

[PATCHFILE]
require /path/to/something
require /path/to/something/else
provide /path/to/something/like/foo
provide /path/to/something/like/bar
provide /path/to/something/else/like/foobar

## depend-solve PATCHFILE [PATCHFILE...]

PATCHFILE A (root)
PATCHFILE B -> PATCHFILE A
PATCHFILE C -> PATCHFILE A
PATCHFILE D -> PATCHFILE B

Detect dependencies between patches in TREEDIR.

* detect patch without parent (root node) 
* detect dependencies between patches (using depend-tree)
before applying.

## merge TREEDIR

Apply all patches in TREEDIR, by :

* detecting root node 
* detecting dependencies between patches before applying.
* applying patches using dependency order

## diff TREEFILEA TREEFILEB

Create a patch by comparing two trees


