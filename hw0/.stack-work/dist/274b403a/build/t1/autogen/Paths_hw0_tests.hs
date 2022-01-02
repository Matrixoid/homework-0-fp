{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hw0_tests (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\homework-0-fp\\hw0\\.stack-work\\install\\fe8fa141\\bin"
libdir     = "C:\\homework-0-fp\\hw0\\.stack-work\\install\\fe8fa141\\lib\\x86_64-windows-ghc-8.10.4\\hw0-tests-0.1.0.0-Dptp6sJ25YUHvLnG1YvGjS-t1"
dynlibdir  = "C:\\homework-0-fp\\hw0\\.stack-work\\install\\fe8fa141\\lib\\x86_64-windows-ghc-8.10.4"
datadir    = "C:\\homework-0-fp\\hw0\\.stack-work\\install\\fe8fa141\\share\\x86_64-windows-ghc-8.10.4\\hw0-tests-0.1.0.0"
libexecdir = "C:\\homework-0-fp\\hw0\\.stack-work\\install\\fe8fa141\\libexec\\x86_64-windows-ghc-8.10.4\\hw0-tests-0.1.0.0"
sysconfdir = "C:\\homework-0-fp\\hw0\\.stack-work\\install\\fe8fa141\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hw0_tests_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hw0_tests_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hw0_tests_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hw0_tests_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hw0_tests_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hw0_tests_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
