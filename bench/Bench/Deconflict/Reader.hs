{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
module Bench.Deconflict.Reader
where

import Data.Avro.Deriving
import Text.RawString.QQ

deriveAvroFromByteString [r|
{
  "type": "record",
  "name": "Outer",
  "fields": [
    { "name": "name", "type": "string" },
    { "name": "inner", "type": {
        "type": "record",
        "name": "Inner",
        "fields": [
          { "name": "id", "type": "int" },
          { "name": "smell", "type": ["null", "string"], "default": null }
        ]
      }
    },
    { "name": "other", "type": "Inner" }
  ]
}
|]
