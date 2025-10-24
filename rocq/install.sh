#!/bin/sh

opam repo add rocq-released https://rocq-prover.org/opam/released "$@"
opam pin add rocq-prover 9.0.0 "$@"

