<?php
$R=5;
$r=1;
$a=4;
$nRev=10;
$pi=3.14159265359;
$xsgm=-118.289234;
$ysgm=34.02116;
$x0=$R+$r-$a;
$y0=0;
$scale=0.001;
?>

<pre>
<?php for($t=0.0; $t<($pi*$nRev);$t=$t+0.01):?>
<?php
$x=($R+$r)*cos(($r/$R)*$t)-$a*cos((1+($r/$R))*$t);
$y=($R+$r)*sin(($r/$R)*$t)-$a*sin((1+($r/$R))*$t);
$x=$x*$scale;
$y=$y*$scale;?>
&ltPlacemark&gt
&ltstyleUrl&gt#z1&lt/styleUrl&gt&ltPoint&gt&ltcoordinates&gt<?php echo $xsgm+$x;?>,<?php echo $ysgm+$y?>&lt/coordinates&gt&lt/Point&gt
&lt/Placemark&gt
<?php endfor;?>
</pre>