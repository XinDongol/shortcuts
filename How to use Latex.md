### Spacing Commands:

\, thin space (normally 1/6 of a quad);

\> medium space (normally 2/9 of a quad);

\; thick space (normally 5/18 of a quad);

\! negative thin space (normally 1/6 of a quad).


### Step Fucntion:

- Method 1

```Latex
$$ f(x)=\left\{
\begin{aligned}
x & = & \cos(t) \\
y & = & \sin(t) \\
z & = & \frac xy
\end{aligned}
\right.
$$
```
- Method 2

```Latex
$$ F^{HLLC}=\left\{
\begin{array}{rcl}
F_L       &      & {0      <      S_L}\\
F^*_L     &      & {S_L \leq 0 < S_M}\\
F^*_R     &      & {S_M \leq 0 < S_R}\\
F_R       &      & {S_R \leq 0}
\end{array} \right. $$
```
- Method 3

```Latex
$$f(x)=
\begin{cases}
0& \text{x=0}\\
1& \text{x!=0}
\end{cases}$$
```