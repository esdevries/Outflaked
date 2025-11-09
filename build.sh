#!/usr/bin/env bash

nix flake update
home-manager switch --flake "."
