Interactive Ruby (IRb)
======================

Interactive Ruby Shell (IRB or irb) is a REPL for programming in the object-oriented scripting language Ruby. The abbreviation irb comes from the fact that the filename extension for Ruby is ".rb", although interactive Ruby files do not have an extension of ".irb". The program is launched from a command line and allows the execution of Ruby commands with immediate response, experimenting in real-time. It features command history, line editing capabilities, and job control, and is able to communicate directly as a shell script over the Internet and interact with a live server. It was developed by Keiju Ishitsuka.

Usage

```
irb [ options ] [ programfile ] [ argument... ]

  -f                Suppress read of ~/.irbrc
  -m                Bc mode (load mathn, fraction or matrix are available)
  -d                Set $DEBUG to true (same as `ruby -d')
  -r load-module    Same as `ruby -r'
  -I path           Specify $LOAD_PATH directory
  -U                Same as `ruby -U`
  -E enc            Same as `ruby -E`
  -w                Same as `ruby -w`
  -W[level=2]       Same as `ruby -W`
  --inspect         Use `inspect' for output (default except for bc mode)
  --noinspect       Don't use inspect for output
  --readline        Use Readline extension module
  --noreadline      Don't use Readline extension module
  --prompt prompt-mode
  --prompt-mode prompt-mode
                    Switch prompt mode. Pre-defined prompt modes are
                    `default', `simple', `xmp' and `inf-ruby'
  --inf-ruby-mode   Use prompt appropriate for inf-ruby-mode on emacs.
                    Suppresses --readline.
  --simple-prompt   Simple prompt mode
  --noprompt        No prompt mode
  --tracer          Display trace for each execution of commands.
  --back-trace-limit n
                    Display backtrace top n and tail n. The default
                    value is 16.
  --irb_debug n     Set internal debug level to n (not for popular use)
  -v, --version     Print the version of irb
```

Example
-------

```
irb
irb(main):001:0> 10 + 2
=> 12
irb(main):002:0> 10 - 2
=> 8
irb(main):003:0> 10 * 2
=> 20
irb(main):004:0> 10 / 2
=> 5
irb(main):005:0> 10 % 2
=> 0
irb(main):006:0> i = 1
=> 1
irb(main):007:0> puts i
1
=> nil
irb(main):008:0> 

```


Restrictions
------------

Because of the way irb works, there is a minor incompatibility between it and the standard Ruby interpreter. The problem lies in the determination of local variables.

Normally, Ruby looks for an assignment statement to determine if something is a variable. If a name hasn't been assigned to, then Ruby assumes that name is a method call. 

Local variables should be determined at compile time, thus local variables defined first in the evaluated string, can only be accessed from other evaluated strings. In addition, they will be more ephemeral in Ruby2, so that these variables will not be accessed from outside.

The difference is that in IRB everything is being evaluated, so it's all in the same scope.
