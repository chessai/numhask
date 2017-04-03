{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE DataKinds #-}

-- | NumHask usage examples

module NumHask.Examples (
    -- * Examples

    -- ** Imports and Pragmas
    -- $imports
    -- $setup

    -- ** Basic Arithmetic
    -- $basic

    -- ** Vectors
    -- $vector

    ) where

import NumHask.Prelude

-- $imports
-- NumHask.Prelude is a complete replacement for the standard prelude.
--
-- 'NoImplicitPrelude' is explicitly required as a pragma, and 'ExtendedDefaultRules' is needed to avoid having to explicitly type literal numbers.
--
-- $setup
-- >>> :set -XNoImplicitPrelude
-- >>> :set -XExtendedDefaultRules
-- >>> import NumHask.Prelude
--
-- $basic
-- 'Int', 'Integer', 'Double' and 'Float' are from base.  NumHask takes these classes and redefines the basic arithmetic operators.
--
-- >>> 1 + 1
-- 2
--
-- >>> 1 - 1
-- 0
--
-- >>> 1 * 1
-- 1
--
-- >>> 1 / 1
-- 1.0
--
-- Note that the literal numbers in the divide above defaulted to Float rather than Int.
-- 
-- >>> 1 / (1::Int)
-- ...
-- ... No instance for (MultiplicativeGroup Int)
-- ... arising from a use of ‘/’
-- ...
--
-- >>> 1 / fromIntegral (1::Int)
-- 1.0
-- 
-- >>> 1 `div` 2
-- 0
--
-- >>> 3 `mod` 2
-- 1
--
-- 'Float' and 'Double' are 'NumHask.Algebra.Fields.Field' instances.
--
-- >>> zero == 0.0
-- True
--
-- >>> one == 1.0
-- True
--
-- >>> 1.0 + 1.0
-- 2.0
--
-- >>> 1.0 - 1.0
-- 0.0
--
-- >>> 1.0 * 1.0
-- 1.0
--
-- >>> 1.0 / 1.0
-- 1.0
--
-- 'BoundedField' lets divide by zero work for 'Float's and 'Double's.
--
-- >>> one/zero
-- Infinity
--
-- >>> -one/zero
-- -Infinity
--
-- >>> zero/zero+one
-- NaN
-- 
-- >>> logBase 2 4
-- 2.0
-- 
-- >>> 2 ** 2
-- 4.0
-- 
-- >>> sqrt 4
-- 2.0
-- 
-- >>> exp 2
-- 7.38905609893065
--
-- >>> log 2
-- 0.6931471805599453
--
-- $vector
-- A 'Vector' is a number by virtue of it being a 'Representable' 'Functor' where the representation is an 'Int'.
--
-- >>> :set -XDataKinds
-- >>> :set -XOverloadedLists
-- >>> [] :: Vector 3 Int
-- [0,0,0]
--
-- >>> let a = [1..] :: Vector 3 Int
-- >>> a
-- [1,2,3]
--
-- >>> let b = [3,2] :: Vector 3 Int
-- >>> b
-- [3,2,0]
--
-- >>> let c = [1.0,2.0] :: Vector 3 Float
-- >>> let d = [3.0,2.0] :: Vector 3 Float
--
-- >>> a+zero==a
-- True
-- >>> zero+a==a
-- True
-- >>> a+b
-- [4,4,3]
--
-- >>> a-a == zero
-- True
--
-- >>> a * b
-- [3,4,0]
--
-- >>> let a' = unsafeToVector . someVector $ a :: Vector 2 Int
-- >>> let b' = unsafeToVector . someVector $ b :: Vector 2 Int
-- >>> a' `divMod` b'
-- ([0,1],[1,0])
--
-- >>> c / d
-- [0.33333334,1.0,NaN]
--
-- >>> size c :: Float
-- 2.236068
--
-- >>> distance c d :: Float
-- 2.0
--
-- >>> c <.> d :: Float
-- 7.0
--
-- The type of an outer product of two vectors is a Vector m (Vector n), and is a perfectly formed Matrix representation.
-- >>> a >< b
-- [[3,2,0],[6,4,0],[9,6,0]]
--
-- >>> (a >< b) >< (b >< a)
-- [[[9,12,0],[6,8,0],[0,0,0]],[[18,24,0],[12,16,0],[0,0,0]],[[27,36,0],[18,24,0],[0,0,0]]]

