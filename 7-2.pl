$count = 0;
while (chomp($line = <>)) {
  @outside = split /\[.*?\]/, $line;
  @inside = $line =~ /\[(.*?)\]/g;
  print $line, "\n";
  print join ' ', @outside, "\n";
  print join ' ', @inside, "\n";

  @abas = ();

  foreach $o (@outside) {
    @chars = split '', $o;
    for $i (0..$#chars - 2) {
      if ($chars[$i] eq $chars[$i+2] and $chars[$i] ne $chars[$i+1]) {
        push @abas, $chars[$i+1].$chars[$i].$chars[$i+1];
      }
    }
  }

  $valid = 0;
  foreach $i (@inside) {
    foreach $a (@abas) {
      print "check $a in $i";
      if ($i =~ /$a/) {
        print "---- found!";
        $valid = 1;
      }
      print "\n";
    }
  }
  $count++ if $valid;
}
print $count, "\n";
