module SystemPkgs where

import PkgDB
import Utils

import Data.Maybe
import Distribution.Text
import Distribution.Version

-- only here for testing purposes
theDb = foldr processString emptyPkgDB (ghcProvides ++ extraProvides ++ communityProvides)
    where
        processString s db = let
                d = fromJust $ simpleParse s
                n = depName d
                v = fromJust $ isSpecificVersion $ depVersionRange d
            in addBasePkg db n v

ghcProvides =
    [ "base ==4.2.0.2"
    , "array ==0.3.0.1"
    , "bytestring ==0.9.1.7"
    , "Cabal ==1.8.0.6"
    , "containers ==0.3.0.0"
    , "directory ==1.0.1.1"
    , "extensible-exceptions ==0.1.1.1"
    , "filepath ==1.1.0.4"
    , "haskell98 ==1.0.1.1"
    , "hpc ==0.5.0.5"
    , "old-locale ==1.0.0.2"
    , "old-time ==1.0.0.5"
    , "pretty ==1.0.1.1"
    , "process ==1.0.1.3"
    , "random ==1.0.0.2"
    , "syb ==0.1.0.2"
    , "template-haskell ==2.4.0.1"
    , "time ==1.1.4"
    , "unix ==2.4.0.2"
    ]

extraProvides =
    [ "binary ==0.5.0.2"
    , "cgi ==3001.1.7.3"
    , "dataenc ==0.13.0.4"
    , "deepseq ==1.1.0.0"
    -- , "extensible-exceptions ==0.1.1.2"
    , "hashed-storage ==0.5.3"
    , "haskeline ==0.6.3.1"
    , "haskell-src ==1.0.1.3"
    , "html ==1.0.1.2"
    , "HTTP ==4000.0.9"
    , "HUnit ==1.2.2.1"
    , "mmap ==0.5.7"
    , "mtl ==1.1.0.2"
    , "network ==2.2.1.7"
    , "packedstring ==0.1.0.1"
    , "parallel ==2.2.0.1"
    , "parsec ==2.1.0.1"
    , "QuickCheck ==2.1.1.1"
    , "regex-base ==0.93.2"
    , "regex-compat ==0.93.1"
    , "regex-posix ==0.94.2"
    , "stm ==2.1.2.1"
    , "tar ==0.3.1.0"
    , "terminfo ==0.3.1.3"
    , "text ==0.10.0.0"
    , "utf8-string ==0.3.6"
    , "xhtml ==3000.2.0.1"
    , "zlib ==0.5.2.0"
    ]

communityProvides =
    [ "cairo ==0.12.0"
    , "glib ==0.12.0"
    , "gtk ==0.12.0"
    , "pango ==0.12.0"
    , "hslogger ==1.1.0"
    , "X11 ==1.5.0.0"
    , "X11-xft ==0.3"
    , "xmonad ==0.9.2"
    , "xmonad-contrib ==0.9.2"
    ]
