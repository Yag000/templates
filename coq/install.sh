#!/bin/sh

opam repo add coq-released https://coq.inria.fr/opam/released "$@"
opam pin coq 9.0.0 "$@"
opam install coq "$@"
