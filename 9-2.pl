chomp($line = <>);
print fuck($line), "\n";

sub fuck {
  my $line = shift;
  my $ans = 0;
  print "$ans $line \n";

  if ($line =~ /^(.*?)\((\d+)x(\d+)\)(.*)/) {
    my $pre = $1;
    my $mul = $3;
    my $len = $2;
    my $pos = $4;

    my $subject = substr($pos, 0, $len);
    my $tail = substr($pos, $len, length $pos);
    print "======== $subject $tail =======\n";
    $ans += length($pre) + $mul * fuck($subject);
    $ans += fuck($tail) if $tail;

  } else {
    $ans = length $line;
  }
  print "$ans $line \n";
  return $ans;
}
