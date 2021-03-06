use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my $mm_ver = $ExtUtils::MakeMaker::VERSION;
if ($mm_ver =~ /_/) {
    $mm_ver = eval $mm_ver;
    die $@ if $@;
}

# Nice-to-have prerequisites :
foreach (qw(Digest Digest::MD5)) {
  warn "File::Modified likes to have $_, but doesn't require it.\n"
    unless eval "require $_; 1";
};

WriteMakefile(
    'NAME'          => 'File::Modified',
    'VERSION_FROM'  => 'lib/File/Modified.pm',

    'PREREQ_PM'    => {
        'strict'   => 0,
        'warnings' => 0,
    },

    ($] >= 5.005 ?
      (ABSTRACT_FROM => 'lib/File/Modified.pm',
       AUTHOR     => 'Max Maischein <corion@cpan.org>') : ()),

    ($mm_ver >= 6.48
        ? (MIN_PERL_VERSION => 5.006)
        : ()
    ),

    ($mm_ver >= 6.31
        ? (LICENSE => 'perl')
        : ()
    ),

    ($mm_ver <= 6.45
        ? ()
        : (META_MERGE => {
            'meta-spec' => { version => 2 },
            resources => {
                repository  => {
                    type => 'git',
                    web  => 'https://github.com/neilbowers/File-Modified',
                    url  => 'git://github.com/neilbowers/File-Modified.git',
                },
            },
          })
    ),

    ($mm_ver >= 6.52
        ? (CONFIGURE_REQUIRES => {
                'ExtUtils::MakeMaker' => 6.30,
          })
        : ()
    ),

    ($mm_ver >= 6.64
        ? (TEST_REQUIRES => {
                'Test::More' => 0.88,
          })
        : ()
    ),

);
