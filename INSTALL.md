# INSTALLATION INSTRUCTIONS #

The latest version of this software is always available from Github

```
git clone [% NAME %]
cd [% NAME %]
```

If on a modern system:

`cpan .`

Or (faster, if available):

`cpanm .`

Failing that manual install: 

```
perl Makefile.PL
make
make test
make install
```

If installing manually dependecies will have to installed individually.
