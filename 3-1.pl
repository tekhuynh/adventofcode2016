$count = 0;
while (chomp($line = <>)) {
  @numbers = $line =~ /(\d+)/g;
  @numbers = sort { $a <=> $b } @numbers;
  $count++ if $numbers[0] + $numbers[1] > $numbers[2];
}
print $count, "\n";
