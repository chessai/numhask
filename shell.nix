{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc802" }:

let
  inherit (nixpkgs) pkgs;

  f = 
    { mkDerivation, adjunctions, base, distributive, doctest, matrix
    , protolude, QuickCheck, singletons, stdenv, tasty
    , tasty-quickcheck, vector
    }:
    mkDerivation {
      pname = "numhask";
      version = "0.1.2";
      src = ./.;
      libraryHaskellDepends = [
        adjunctions base distributive matrix protolude QuickCheck
        singletons vector
      ];
      testHaskellDepends = [ base doctest tasty tasty-quickcheck ];
      homepage = "https://github.com/tonyday567/numhask";
      description = "A numeric prelude";
      license = stdenv.lib.licenses.bsd3;
    };
  
  haskellPackages = pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in
  if pkgs.lib.inNixShell then drv.env else drv

