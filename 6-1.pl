%hash = ();
while (chomp($line = <>)) {
  @chars = split '', $line;

  for $i (0 .. $#chars) {
    $hash{$i}{$chars[$i]}++;
  }
}
for $i (0..$#chars) {
  @r = sort { $hash{$i}{$a} <=> $hash{$i}{$b} } keys %{$hash{$i}};

  print $r[0];
}
