Hajime (はじめ)
===============

Hajime is a configuration daemon.


Configuration structure
-----------------------

A hajime configuratoin is :

* either a full tree, with keys, types, and default values
* or a partial tree (a "patch"), with an additional attribute "parent" at the root element


### Hajime tree

/etc/hajime/tree.conf

```
name: Hajime
type: object
default: ...
body: 
  - name: WLANConfiguration
    type: object
  - name: PPPConfiguration
    type: object
    
```

### Hajime migration

```
rename:
  src: Hajime.WLANConfiguration.OpticLine
  dst: Hajime.Network.FiberNetwork

prepend:
  parent: Hajime.Network
  name: Fiber
  type: object
  default: true
  
insert:
  ...
```
  

Configuration update
--------------------

### CLI

- A configuration update is a transaction
- It must start with the BEGIN UPDATE command
- It must include a list of commands
  - DELETE Hajime.PPPConfiguration.
  - SET Hajime.WLANConfiguration.Name = "value"
- It must end either with a ROLLBACK or a COMMIT command

## JSON

```
[{ delete: { key: "..." } },
 { update: { key: "Hajime.WLANConfiguration", value: "..." } },
 ...
]
```


## Errors

* When value has not the correct type
* When a application scripts failed


Application scripts
-------------------

Script registration is static only (only at launch time)

/etc/hajime/scripts.conf
 
```
REGISTER Hajime.PPPConfiguration /etc/hajime/update-ppp-configuration
REGISTER 
```

### JSON

FIXME: Configuration 


Reading values
--------------

## CLI

    $ hajime-cli get Hajime.something
    value

    $ hajime-cli export Hajime
    HAJIME_PPPCONFIGURATION=value1
    HAJIME_WANCONFIGURATION=value2


Communication between daemon & cli
----------------------------------

- unix socket ?
- other ?

