**ASTUce: ActionScript Test Unit compact edition**

ASTUce is a regression testing framework
inspired by the [xUnit architecture](http://www.xprogramming.com/software.htm).

This framework is intended for developers who wish
to implement unit tests in ECMAScript ([ECMA-262](http://www.ecma-international.org/publications/standards/Ecma-262.htm)) and ActionScript 3.

**Features:**

  * work with any ECMA-262 compliant hosts
  * work with any ES4/AS3 compliant hosts
  * not dependent on Events (eg. will work with [redtamarin](https://code.google.com/p/redtamarin/))
  * simple to install and to use
  * same [API](http://en.wikipedia.org/wiki/Application_programming_interface) everywhere
  * code [reflection](http://en.wikipedia.org/wiki/Reflection_%28computer_science%29)
  * easily [localizable](http://en.wikipedia.org/wiki/I18n)
  * run your unit tests on the command-line (integrate with Ant, Maven, server-side, etc.)


**Releases:**

  * ASTUce CLI v0.1 for AS3
    * command-line client (single exe, no dependencies)
    * cross-platform (OS X, Linux, Windows)
    * work with build tools like ant (see [an example here with gaforflash](https://code.google.com/p/gaforflash/source/browse/tags/1.0.2/build.xml#153) and [the output result](http://code.google.com/p/gaforflash/issues/detail?id=41))
    * tag: [ASTUce CLI v0.1.0](http://astuce.googlecode.com/svn/cli/tags/0.1.0)

  * ASTUce v0.9 for AS3
    * stable release in the download section
    * SWC for Flash CS3 and Flex Builder 3
    * tag: [ASTUce v0.9.0 stable (AS3)](http://astuce.googlecode.com/svn/tags/0.9.0)
  * ASTUce for JS/AS1/AS2
    * we decided to stop working on those versions to focus on AS3
    * if you need support or want to add features for those versions contributor spots are always open (and we will help)

## News ##

[follow ASTUce on Ohloh](http://www.ohloh.net/projects/ASTUce)

if you use the framework and/or the command-line client please show it :)
&lt;wiki:gadget url="http://www.ohloh.net/projects/ASTUce/widgets/project\_users.xml" height="100"  border="0" /&gt;

## FAQ ##

  * Why another AS3 xUnit framework ?
> ASTUce exists since Flash 5, it started as an AS1/JS project, then was ported to AS2 and later AS3

  * Why I never heard about it before ?
> because we sucks at PR / Marketing.

  * I want to contribute what should I do ?
> please go to the [Contributors](Contributors.md) page and fill the form.

  * Does it really run on the command-line ?
> yes.

  * How can you make it run on the command-line ?
> We extended the [Tamarin project](http://www.mozilla.org/projects/tamarin/) with [redtamarin](http://code.google.com/p/redtamarin/) to produce cross-platform executables<br>that act like the Flash Player on the command line<br> and then we embedded the ASTUce AS3 library to produce an ASTUce executable.</li></ul>

  * But how do you load and execute the unit tests in the ASTUce executable ?
> For a a SWF we extract the ABC and then load it in the Domain (or ApplicationDomain) dynamically, and run the tests from memory.

  * Does the ASTUce executable work with Ant ?
> yes, here a basic example
```
<exec executable="./ASTUce" failonerror="true">
    <arg line="-s" />
    <arg line="-l:my-tests.swf" />
    <arg line="my.package.AllTests" />
</exec>
```

## misc ##

the project owners can be contacted here: `their username [at] gmail [dot] com`

## stats ##

|&lt;wiki:gadget url="http://www.ohloh.net/projects/ASTUce/widgets/project\_factoids.xml" width="320" height="220" border="0" /&gt;|&lt;wiki:gadget url="http://www.ohloh.net/projects/ASTUce/widgets/project\_languages.xml" width="320" height="220" border="0" /&gt;|&lt;wiki:gadget url="http://www.ohloh.net/projects/ASTUce/widgets/project\_basic\_stats.xml" height="220"  border="0" /&gt;|
|:---------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------|