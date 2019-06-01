
module HsImport.SymbolImport
   ( SymbolImport(..)
   , Symbol(..)
   , symbol
   , isSymbolImportHidden
   )
where

type Name = String

-- | What of the symbol should be imported.
data Symbol
   = Only Name            -- ^ only the symbol should be imported
   | AllOf Name           -- ^ all constructors or methods of the symbol should be imported: Symbol(..)
   | SomeOf Name [String] -- ^ some constructors or methods of the symbol should be imported: Symbol(X, Y)
   deriving (Show)


data SymbolImport
   = Import Symbol
   | Hiding Symbol
   deriving (Show)

symbol :: SymbolImport -> Symbol
symbol (Hiding s) = s
symbol (Import s) = s

isSymbolImportHidden :: SymbolImport -> Bool
isSymbolImportHidden (Hiding _) = True
isSymbolImportHidden (Import _) = False
