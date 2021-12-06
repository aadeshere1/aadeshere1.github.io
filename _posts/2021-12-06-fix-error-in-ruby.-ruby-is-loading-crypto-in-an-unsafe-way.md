---
layout: post
title: Fix error in ruby. ruby is loading crypto in an unsafe way
date: 2021-12-06
---

When working on a rails project that integrates blockchain technology, libcrypto was being used. Suddenly I received following error.

WARNING: /Users/namespace/.rbenv/versions/3.0.1/bin/ruby is loading libcrypto in an unsafe way



To fix the error I had to follow the following steps to fix it

```
brew update && brew upgrade && brew install openssl

cd /usr/local/Cellar/openssl@1.1/1.1.1l_1/lib

sudo cp libssl.1.1.dylib libcrypto.1.1.dylib /usr/local/lib

cd /usr/local/lib

mv libssl.dylib libssl_bak.dylib

mv libcrypto.dylib libcrypto_bak.dylib

sudo ln -s libssl.1.1.dylib libssl.dylib

sudo ln -s libcrypto.1.1.dylib libcrypto.dylib
```

Make sure to note the version of openssl installed by `brew install openssl` and change the rest of the steps accordingly.
        