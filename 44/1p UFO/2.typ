#import "../template.typ": prase
#prase(3, "1. podzimní série", 2)

#let square = math.class("binary", sym.square)

Musíme vyplnit $square$ v následující rovnici znaménky $+$ a $-$ tak, aby byl součet $a$ kladný a co nejmenší.

$ a = 1 square 2 square 3 square ... square 4320 square 4321 $
$ a in NN_1 $

Vzhledem k tomu, že znaménko před $1$ neovlivníme (je tam vždy $+$), tak můžeme $1$ přehodit na druhou stranu a zjednodušit tím problém. Součet takových čísel bude $b = a - 1$ a jejich počet bude $n = 4320$.

$
  a - 1 &= overbrace(square 2 square 3 square ... square 4320 square 4321, n "čísel") \
  b &= square 2 square 3 square ... square 4320 square 4321 \
$
$ b in NN_0 $

Když postupně zapíšeme hodnoty do tabulky takovým způsobem, že v prvním sloupci půjdeme od začátku sekvence, a v druhým naopak od konce, tak si všimneme, že všechny takové dvojice čísel mají stejný součet. Celkový počet takových dvojic (řádků v tabulce) je $n\/2 = 2160$.

#set math.cases(reverse: true)

#align(center, 
  table(
    columns: 3,
    align: center,
    table.header($x$, $y$, $x+y$),
    $2$, $4321$, $4323$,
    $3$, $4320$, $4323$,
    $...$, $...$, $...$,
    $2160$, $2163$, $4323$,
    $2161$, $2162$, $4323$,
  )
)

Nejmenší možný součet $b$, který splňuje zadání je 0. Toho můžeme dosáhnout když budeme na přeskáčku přičítat a odečítat $4323$. Takových párů bude $n\/2\/2 = n\/4 = 1080$. A protože je počet párů přirozené číslo, tak nám nebude na konci chybět $-4323$.

$ overbrace(+ 4323 - 4323, n\/4 "párů") space dots = 0 $

Nemusíme ale přičítat a odčítat na přeskáčku, bude stačit, když první půlku 4323 přičteme a tu druhou naopak odečteme. Výsledek zůstane stejný, ale řešení se nám zjednodušší.

$
  + (&2 + 4321) &&+ (&&3 + 4320) &&+ ... - (&&2160 + 2163) &&- (&&2161 + 2162) &= 0 \
  + &2 + 4321 &&+ &&3 + 4320 &&+ ... - &&2160 - 2163 &&- &&2161 - 2162 &= 0 \
$

Takže když rozepíšeme sekvenci v zadání, tak bude distribuce $+$ a $-$ vypadat takhle:

+ sčítání ($n\/4 = 1080$ čísel) $ in angle.l 2\, 1081 angle.r$
+ odčítání ($n\/2 = 2160$ čísel) $ in angle.l 1082\, 3241 angle.r$
+ sčítání ($n\/4 = 1080$ čísel) $ in angle.l 3242\, 4231 angle.r$

Před čísly od $1082$ do $3241$ bude znaménko $-$, před ostatními bude znaménko $+$.