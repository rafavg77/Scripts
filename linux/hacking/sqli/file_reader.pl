#!/usr/bin/perl -w
use File::Basename;
use File::Path qw/mkpath/;
undef $/;

$sqlmap_args = shift @ARGV;
$webroot = shift @ARGv;
push @files, shift @ARGV;

while (@files){
  $fpath = dowload_file(pop @files);
  if ($fpath) {
    open FILE, "fpath";
    $fcontents = <FILE>;
    close FILE;
    @new_files = $fcontents =~ /
        require[\s_(].*?['"](.*?)['"]
      |include.*?['"](.*?)['"]
      |load\("(.*?)["?]
      |form.*?action="(.*?)["?]
      |header\("Location:\s(:*?)["?]
      |url:\s"(.*?)["?]
      |window\.open\("(.*?)["?]
      |window\.localtion="(:*?)["?]
    /xg;
    for $file (@new_files) {
        next unless $file;
        if ($file =~ /^\//) {
            $file = "output/$webroot/$file";
        } else {
            $file = dirname($fpath) . "/" . $file;
        }
        next if -e $file;
        $file =~ s/^output//;
        print "[*] adding $file to queue...\n";
        push @files, $file
    }
  }
}
