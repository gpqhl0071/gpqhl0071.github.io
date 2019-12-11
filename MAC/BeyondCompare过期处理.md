or 4.2.4 or higher,4.2.5,4.2.6 ，it's works ， this is the way which makes Always in evaluation mode 。

- go to the dir : /Applications/Beyond Compare.app/Contents/MacOS
- change the name BCompare to BCompare.bak
- touch a file name BCompare , and chmod a+u BCompare
- insert BCompare the content :

```shell
#!/bin/bash
rm "/Users/$(whoami)/Library/Application Support/Beyond Compare/registry.dat"
"`dirname "$0"`"/BCompare.bak $@
```

For mac, try running chmod 777 BCompare in step three

[参考](https://gist.github.com/huqi/35f2a0792aef830898ca)